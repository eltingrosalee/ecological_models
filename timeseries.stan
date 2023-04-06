data {
  int <lower=0> N; 
	vector [N] X; 
}

parameters {
real phi; 
real b; 
real <lower=0> sigma; 
}

model { 
for(i in 2:N){
	X[i] ~ normal(phi * X[i-1] + b, sigma);
}
sigma ~ normal(0,1);
phi ~ normal(0,5);
b ~ normal(0,1);
}
