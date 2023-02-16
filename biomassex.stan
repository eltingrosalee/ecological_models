data { 
  int<lower=0> N; 
  int<lower=0> N_site;
  vector<lower=0>  [N] y; 
  int<lower=0>  site_id [N]; 
}
  
parameters { 
  vector<lower=0> [N_site] mu_site; //site level mean, length of 8 
  real<lower=0> sigma_plot; 
  real<lower=0>  sigma_site; 
  real<lower=0>  mu; //group level mean  
}
  
  model { 
    for( i in 1: N){
      y[i] ~ normal(mu_site[site_id[i]], sigma_plot);
}
    mu_site ~ normal(mu, sigma_site);
    //now prior distribtuions for the parameters 
    mu ~ gamma(1, 0.001);
    sigma_plot ~ normal(0,100); 
    sigma_site ~ normal(0,100);
} 

