package br.com.predialadm.classecon.database;

import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;
import org.hibernate.tool.hbm2ddl.SchemaUpdate;

public class GerarBanco {
	
	private static Configuration getConfiguration() {
		return new AnnotationConfiguration().configure();
	}
	
	private static void criarBanco() {
		SchemaExport schemaExport = new SchemaExport(getConfiguration());
		schemaExport.create(true, true);
	}

	private static void atualizarBanco() {
		SchemaUpdate schemaUpdate = new SchemaUpdate(getConfiguration());
		schemaUpdate.execute(true, true);
	}
	
	public static void main(String[] args) {
		criarBanco();
	}

}
