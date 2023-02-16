data { 
  int<lower=0> n; 
  int<lower=0> n_site;
  int<lower=0> beta1; 
  vector<lower=0>  [n] y; 
  int<lower=0>  site_id [n]; 
  int<lower=0> nit [n];
}
  
parameters { 
  vector<lower=0> [n_site] mu_site_nit; //site level mean, with nit addition, length of 8
  vector<lower=0> [n_site] mu_site_cntr; //site level mean, without nit addition, length of 8
  real<lower=0> sigma_plot; //given value
  real<lower=0>  sigma_site; //given value
  real<lower=0> mu; //group level mean  for all treatments

}


  
  model { 
    for( i in 1: n){
      if (nit[i] == 1)
          y[i] ~ normal(mu_site_nit, sigma_plot);
      else
          y[i] ~normal(mu_site_cntr, sigma_plot);
}
    mu_site_nit~ normal((mu + beta1), sigma_site); //eight means for each site's 3 plots with nitrogen
    mu_site_cntr~ normal(mu, sigma_site); //eight means for each site's 3 plots without nitrogen 
    mu ~ gamma(1, 0.001);  //this and subsequent rows are prior distribtuions for the parameters 
    sigma_plot ~ normal(0,100); 
    sigma_site ~ normal(0,100);
}


