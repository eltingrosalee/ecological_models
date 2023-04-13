data {
  int <lower=0> N; 
	vector [N] X; 
}

parameters {
real phi; 
real mu; 
real <lower=0> sigma; 
}

model { 
for(i in 2:N){
	X[i] ~ normal((1-phi)* mu + phi* X[i-1], sigma);
}
sigma ~ normal(0,1);
phi ~ normal(0,5);
mu ~ normal(100, 10);
}
