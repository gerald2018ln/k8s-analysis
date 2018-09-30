build:
	docker build -t k8s-analysis .
push:
	docker tag k8s-analysis gerald1248/k8s-analysis:latest
	docker push gerald1248/k8s-analysis:latest
install:
	helm install --name=k8s-analysis .
delete:
	helm delete --purge k8s-analysis
