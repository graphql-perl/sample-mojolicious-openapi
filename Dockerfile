FROM graphqlperl/sample-openapi-prereq:latest

# Copy the current directory contents into the container
ADD . /app/

# Set the working directory
WORKDIR /app

RUN prove -l t \
  && true

EXPOSE 80

# any ENV here

CMD ["./myapp.pl", "daemon", "-l", "http://*:80"]
