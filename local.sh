echo "Launching Nginx Docker Container..."
{
	docker run -p 80:80 -d --name nginx nginx
}  &> /dev/null
curl localhost