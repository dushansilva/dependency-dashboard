:CREATE TABLE IF NOT EXISTS DEPENDENCY_SUMMERY(
   summaryId VARCHAR(255) NOT NULL,
   repo_id VARCHAR(255) NOT NULL,
   using_lastest_versions INT DEFAULT NULL,
   next_version_available INT DEFAULT NULL,
   next_incremental_available INT DEFAULT NULL,
   next_minor_available INT DEFAULT NULL,
   next_major_available INT DEFAULT NULL,
   PRIMARY KEY ( summaryId ),
    FOREIGN KEY (repo_id) REFERENCES PRODUCT_REPOS(REPO_ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS PRODUCTS(
   product VARCHAR(150) NOT NULL,
   organization VARCHAR(150) NOT NULL,
   repo_mame VARCHAR(150) NOT NULL,
   PRIMARY KEY ( repo_mame )
)ENGINE INNODB;
 
ALTER TABLE PRODUCTS ADD id int NOT NULL AUTO_INCREMENT
alter table product add primary key(RepoName);



CREATE TABLE IF NOT EXISTS DEPENDENCY_SUMMARY(
SUMMARY_ID INT(11) NOT NULL AUTO_INCREMENT,
REPO_ID INT(11) NOT NULL,
USING_LASTEST_VERSIONS INT DEFAULT NULL,
NEXT_VERSION_AVAILABLE INT DEFAULT NULL,
NEXT_INCREMENTAL_AVAILABLE INT DEFAULT NULL,
NEXT_MINOR_AVAILABLE INT DEFAULT NULL,
NEXT_MAJOR_AVAILABLE INT DEFAULT NULL,
PRIMARY KEY ( SUMMARY_ID ),
FOREIGN KEY (REPO_ID) REFERENCES PRODUCT_REPOS(REPO_ID) ON DELETE CASCADE;
)ENGINE=INNODB DEFAULT CHARSET=UTF8;

INSERT INTO DEPENDENCY_SUMMARY (REPO_ID, USING_LASTEST_VERSIONS, NEXT_VERSION_AVAILABLE,NEXT_INCREMENTAL_AVAILABLE,NEXT_MINOR_AVAILABLE,NEXT_MAJOR_AVAILABLE) VALUES(20, 23, 49,6,9,539)  ON DUPLICATE KEY UPDATE using_lastest_versions=5 , next_version_available=55,next_incremental_available=53, next_minor_available=59,next_major_available=54;


ALTER TABLE DEPENDENCY_SUMMERY add FOREIGN KEY (product) REFERENCES PRODUCTS(repo_mame) ON DELETE CASCADE;
 INSERT INTO DEPENDENCY_SUMMERY (product, using_lastest_versions, next_version_available,next_incremental_available,next_minor_available,next_major_available) VALUES('product-is', 23, 49,6,9,539)  ON DUPLICATE KEY UPDATE using_lastest_versions=5 , next_version_available=55,next_incremental_available=53, next_minor_available=59,next_major_available=54;
 INSERT INTO DEPENDENCY_SUMMERY (product, using_lastest_versions, next_version_available,next_incremental_available,next_minor_available,next_major_available) VALUES('product-apim', 2, 19,66,99,59) ON DUPLICATE KEY UPDATE using_lastest_versions=5 , next_version_available=55,next_incremental_available=53, next_minor_available=59,next_major_available=54;