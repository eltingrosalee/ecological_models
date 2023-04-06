
data {
  int<lower=0> n;
  int<lower=0> n_site;
  vector<lower=0>[n] y;
  int<lower=0> site_id [n] ;
  int<lower=0> nit [n];
  vector<lower=0> [n_site] precip;
}

parameters {
  real<lower=0> sigma_plot;
  real<lower=0> sigma_site;
  real<lower=0> beta1; // effect of adding Nitrogen
  real site_int;
  real<lower=0> site_slope;
  vector<lower=0> [n_site] mu_site; 
}

model {
  for (i in 1:n){
    y[i] ~ normal(mu_site[site_id[i]] + beta1*nit[i], sigma_plot);
  }
  mu_site ~ normal(site_int + site_slope*precip, sigma_site);
  sigma_plot ~ normal(0, 100);
  sigma_site ~ normal(0, 100);
  beta1 ~ normal(100,300);
  site_int ~ normal(0,50);
  site_slope ~ normal(0.6, 0.6);
}

