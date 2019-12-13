package com.example;

import io.vertx.core.Vertx;
import java.util.logging.Logger;

public class Main {

    private static final Logger LOGGER = Logger.getLogger(Main.class.getName());

    public static void main(String[] args) {
        Vertx.vertx().createHttpServer().requestHandler(request -> request.response().end("Hello world!")).listen(8080);
        LOGGER.info("Application listening on port 8080.");
    }
}
