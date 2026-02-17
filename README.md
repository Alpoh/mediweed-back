# mediweed-back

This is a Spring Boot backend application for the Mediweed project.

## Prerequisites

- Java 25
- Maven 3.9+
- Docker

## Running the Application

### Locally (for Development)

You can run the application directly from your IDE by running the `MediweedBackApplication` class or by using the Maven wrapper:

```sh
./mvnw spring-boot:run -Dspring-boot.run.profiles=local
```

This uses the `local` Spring profile.

### Using Docker Compose

The project includes a `compose.yaml` file to run the application in a container.

1.  Build and run the application using Docker Compose:
    ```sh
    docker compose up --build
    ```

This will start the application and set the active Spring profile to `local`.

## Configuration

### Spring Profiles

The application uses Spring Profiles to manage different configurations:

-   **`local`**: The primary profile for local development.

You can activate a profile by setting the `SPRING_PROFILES_ACTIVE` environment variable or by passing the `-Dspring.profiles.active=local` VM option.

## API Documentation

Once the application is running, you can access the interactive API documentation (Swagger UI) at:

[http://localhost:8080/swagger-ui.html](http://localhost:8080/swagger-ui.html)

The raw OpenAPI specification is available at `/api-docs`.
