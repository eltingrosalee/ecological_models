data { 
  int<lower=0> n; 
  vector [n] x;
  int<lower=0,upper=1> y [n];
  }
  
parameters{
  real alpha; 
  real beta; 
}

  model{
    y ~ bernoulli_logit(alpha+beta*x);
    //setting priors
    alpha ~ normal(0, 10);
    beta ~ normal(0, 2);
  }
