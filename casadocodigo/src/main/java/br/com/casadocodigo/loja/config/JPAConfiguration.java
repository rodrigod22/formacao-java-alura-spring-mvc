package br.com.casadocodigo.loja.config;

import java.util.Properties;

import javax.persistence.EntityManagerFactory;

import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

//EnableTransactionManagement delega ao hibernate para gerenciar das transacoes
@EnableTransactionManagement
public class JPAConfiguration {

	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
		
		//cria o entity managem factory
		LocalContainerEntityManagerFactoryBean factoryBean = new LocalContainerEntityManagerFactoryBean();
			
		JpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
		
		//configuracoes do database
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setUsername("root");
		dataSource.setPassword("root");
		dataSource.setUrl("jdbc:mysql://localhost:3308/casadocodigo");
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		
		factoryBean.setJpaVendorAdapter(vendorAdapter);
		
		Properties props = new Properties();
		
		//dialeto que o hibernate se comunica com bd
		props.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5Dialect");
		
		//mostrar as queries feitas pelo hibernate
		props.setProperty("hibernate.show_sql", "true");
		
		//propriedade para o hibernate cuidar do banco 
		props.setProperty("hibernate.hbm2ddl.auto","update");
		
		factoryBean.setJpaProperties(props);
		//configuracao do diretorio onde estao as entidade
		factoryBean.setPackagesToScan("br.com.casadocodigo.loja.model");
		factoryBean.setDataSource(dataSource);		
		
		return factoryBean;		
	}
	
	@Bean
	public JpaTransactionManager transactionManager(EntityManagerFactory emf){
		return new JpaTransactionManager(emf);
	}
}
