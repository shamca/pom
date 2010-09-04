dataSource {
    pooled = true
    driverClassName = "org.hsqldb.jdbcDriver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
          boolean pooling = false

          dbCreate = 'update'
          url = "jdbc:mysql://localhost/pom"
          driverClassName = "com.mysql.jdbc.Driver"
          username = "root"
          password = "admin"
          //dbCreate = "create-drop" // one of 'create', 'create-drop','update'
          //url = "jdbc:hsqldb:mem:devDB"
          //dbCreate = "update"
          // url = "jdbc:hsqldb:file:devDB;shutdown=true"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:hsqldb:mem:testDb"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:hsqldb:file:prodDb;shutdown=true"
        }
    }
}