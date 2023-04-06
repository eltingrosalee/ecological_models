    data {
    int<lower = 1> N;
    int<lower = 1> nstreams;
    int<lower = 1> streamID[N];
    vector[N] time;
    vector[N] mass;
    vector[nstreams] temp;
    real KB;
    }
    
    parameters {
    vector <upper = 0> [nstreams] logk;    
    //real <lower = 0> intercept;
    real<lower = 0.1> phi; //needs to be positive  
    real slope_k_T;
    real int_k_T;
    real <lower = 0> sigma_stream;
    
    
    }
    
    transformed parameters{
    
    vector <lower=0.00001> [nstreams] k; //can't be negative or zero, leaves have to go somewhere. This is a log, so it has to be positive. 
     vector <lower=0, upper=1>[N] yhat; 
      vector <lower=0 > [N] alpha;
     vector <lower=0 > [N] B; //beta, alpha and beta are parameters for beta distribution


k=exp(logk);
    
for (i in 1:N){
      yhat[i]= 1 * exp(-k[streamID[i]]*time[i]);//fixing the intercept here as 1, the starting y value. 
       alpha[i] = yhat[i]*phi;
      B[i] = (1-yhat[i])*phi;
}
      
        
    
    }
    model {
    for (i in 1:N){
    mass[i] ~ beta(alpha[i],B[i]); // likelihood
    }
    for (j in 1:nstreams){
    logk[j]~normal( log(int_k_T) + slope_k_T * (1/(KB*temp[j]) - 1/(KB*283.15)   ) , sigma_stream);
    }
    
    int_k_T ~normal(0,0.1);
    slope_k_T~normal(0,1);
    sigma_stream~normal (0,2);
    
    }
