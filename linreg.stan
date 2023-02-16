data { 
int < lower = 0 > N; //is an integer of number of rows, we constrain 
vector[N] x; //our data is x values, a vector as same length as N
vector[N] y;
} 

parameters{ 
real a;  //real number, this is the intercept 
real b;  //slope
real<lower=0> sigma;  //error, it doesn't go below zero
}

//alternative way (bob likes) to do the model block 
model{
vector [N] yhat;
yhat = a + b*x; //from here above could be put in "transformed parameters"
y ~ normal(yhat, sigma);
a ~ normal(0, 5); //setting priors
b ~ normal(0,10);
sigma ~ normal(0,10);
}

