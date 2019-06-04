package config;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import spring.ChangePasswordService;
import spring.MemberDao;
import spring.MemberRegisterService;

@Configuration
@EnableTransactionManagement
public class MemberConfig {
  @Bean(destroyMethod = "close")
  public DataSource dataSource() {
    DataSource ds = new DataSource();
    ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
    ds.setUrl("jdbc:mysql://localhost/spring5fs?characterEncoding=utf8&serverTimezone=UTC");
    ds.setUsername("bituser");
    ds.setPassword("1004");
    ds.setInitialSize(2);
    ds.setMaxActive(10);
    ds.setTestWhileIdle(true);
    ds.setMinEvictableIdleTimeMillis(6000 * 3);
    ds.setTimeBetweenEvictionRunsMillis(10 * 1000);
    return ds;
  }
  
  @Bean
  public PlatformTransactionManager transactionManager() {
    DataSourceTransactionManager tm = new DataSourceTransactionManager();
    tm.setDataSource(dataSource());
    return tm;
  }
  
  @Bean
  public MemberDao memberDao() {
    return new MemberDao(dataSource());
  }
  
  @Bean
  public MemberRegisterService memberRegSvc() {
    return new MemberRegisterService(memberDao());
  }
  
  @Bean
  public ChangePasswordService changePwdSvc() {
    ChangePasswordService pwdSvc = new ChangePasswordService();
    pwdSvc.setMemberDao(memberDao());
    return pwdSvc;
  }
}
