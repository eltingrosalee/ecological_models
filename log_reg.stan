data { 
  int<lower=0> n; 
  vector [n] x;
  int<lower=0,upper=1> y [n];
  }
  
parameters{
  real alpha; 
  real beta; 
}

transformed parameters{ 
  vector<lower=0, upper=1> [n] phat;
  for(i in 1:n){
  phat[i] = inv_logit(alpha+beta*x[i]);
  }
  }
  
  model{
    y ~ bernoulli(phat);
    //setting priors
    alpha ~ normal(0, 10);
    beta ~ normal(0, 2);
  }
