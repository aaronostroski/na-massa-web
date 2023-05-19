# Use an official Ruby runtime as a parent image
FROM ruby:3.2.1

# Set the working directory to /app
WORKDIR /app

# Install Node.js and Yarn
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update -qq && apt-get install -y nodejs yarn

# Install Rails dependencies
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 4 --retry 3

# Set environment variables
ENV RAILS_ENV=development
ENV DATABASE_URL=postgresql://postgres:password@postgres:5432/na_massa_web_development
ENV RAILS_SERVE_STATIC_FILES=true
ENV RAILS_LOG_TO_STDOUT=true

# Expose port 3000 for the Rails server
EXPOSE 3000

# Set up Postgres database
RUN apt-get install -y postgresql-client
RUN mkdir -p /etc/postgresql/13/main/
RUN echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/13/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/13/main/postgresql.conf

# Install Node.js dependencies
COPY package.json ./
COPY yarn.lock ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Start the Rails server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
