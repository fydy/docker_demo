docker rmi now-php-docker-image --force
docker build --no-cache . -t now-php-docker-image

# Build and test container.
docker run --name now-php-build now-php-docker-image 

# Extract native files.
rm -rf ../native
docker cp now-php-build:/root/app/native ../
docker cp now-php-build:/usr/lib64/php ../
cp -rf ../php ../native

# Remove php build.
docker rm -f now-php-build

chmod +x ../native/php
chmod +x ../native/php-fpm
