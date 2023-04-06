data{
  int<lower=0> n; //number of samples 
  vector [n] wlifted; //independent variable in data, weight lifted
  vector [n] mhoracel; //dependent varible, mean horizontal acceleration
}

parameters{
  real a; //real number that is intercept of linear regression
  real b; //real number that is slope of linear regression 
  real <lower=0> sigma; //real number that is variance 
}

model{
  vector[n] yhat;
  yhat = a + b*wlifted;
  //setting priors for data
  mhoracel ~ normal(yhat, sigma);
  a ~ normal(0,5);
  b ~ normal(0,10); 
  sigma ~ normal(0,10);
}
