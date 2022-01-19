package com.xc.luckysheet.db.server;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@Configuration
public class JfGridServiceConfig {

    @Bean(name = "gridServiceExecutorService")
    ExecutorService gridServiceExecutorService() {
        return Executors.newCachedThreadPool();
    }
}
