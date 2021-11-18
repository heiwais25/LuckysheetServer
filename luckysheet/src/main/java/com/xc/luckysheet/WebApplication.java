package com.xc.luckysheet;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.PlatformTransactionManager;

/**
 * @author cr
 */
@Slf4j
@EnableScheduling
@Configuration
//@SpringBootApplication(scanBasePackages = "com.xc",exclude={MongoAutoConfiguration.class})
@SpringBootApplication
@ComponentScan(basePackages ={"com.xc"} )
public class WebApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(WebApplication.class, args);
        log.info("luckysheet server is started");
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(WebApplication.class);
    }

    /**
     * mysqlTxManager postgresTxManager
     * @param platformTransactionManager
     * @return
     */
    @Bean
    public Object testBean(@Qualifier("postgresTxManager") PlatformTransactionManager platformTransactionManager){
        //启动类中添加如下方法，Debug测试，能知道自动注入的是 PlatformTransactionManager 接口的哪个实现类
        System.out.println(">>>>>>>>>>" + platformTransactionManager.getClass().getName());
        return new Object();
    }

}
