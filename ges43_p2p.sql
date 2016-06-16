CREATE DATABASE  IF NOT EXISTS `ges43_p2p` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ges43_p2p`;
-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: ges43_p2p
-- ------------------------------------------------------
-- Server version	5.7.10

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `DOMIMAssignment`
--

DROP TABLE IF EXISTS `DOMIMAssignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOMIMAssignment` (
  `DOID` varchar(11) NOT NULL,
  `MIMDisease_Phenotype_MIM` varchar(15) NOT NULL,
  `MIMDisease_Uniprot_Disease_Name` varchar(250) NOT NULL,
  `MIMDisease_UniprotKB_Entry` varchar(100) NOT NULL,
  PRIMARY KEY (`DOID`,`MIMDisease_Phenotype_MIM`,`MIMDisease_Uniprot_Disease_Name`,`MIMDisease_UniprotKB_Entry`),
  KEY `fk_DOMIMAssignment_DORecord1_idx` (`DOID`),
  KEY `fk_DOMIMAssignment_MIMDisease1_idx` (`MIMDisease_Phenotype_MIM`,`MIMDisease_Uniprot_Disease_Name`,`MIMDisease_UniprotKB_Entry`),
  CONSTRAINT `fk_DOMIMAssignment_DORecord1` FOREIGN KEY (`DOID`) REFERENCES `DORecord` (`DOID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DOMIMAssignment_MIMDisease1` FOREIGN KEY (`MIMDisease_Phenotype_MIM`, `MIMDisease_Uniprot_Disease_Name`, `MIMDisease_UniprotKB_Entry`) REFERENCES `MIMDisease` (`Phenotype_MIM`, `Uniprot_Disease_Name`, `UniprotKB_Entry`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table captures the link between one MIMdisease record and its one corresponding DO record. Thus each record consist of an MIM disease ID and its Uniprot disease name, plus one of potentially multiple DO records obtained when searching the MIM disease ID in the disease ontology database. Since each MIMdisease record is already uniquely linked to one specific p2p record, so is the linked DO record specific to the original Uniprot record.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOMIMAssignment`
--

LOCK TABLES `DOMIMAssignment` WRITE;
/*!40000 ALTER TABLE `DOMIMAssignment` DISABLE KEYS */;
INSERT INTO `DOMIMAssignment` VALUES ('10923','603903','Sickle cell anemia','P68871'),('12241','603902','Beta-thalassemia, dominant, inclusion body type','P68871'),('12241','613985','Beta-thalassemia','P68871'),('12971','612653','Spherocytosis 4','P02730'),('1520','114500','Colorectal cancer ','P31749'),('1520','114500','Colorectal cancer ','P84996'),('1612','114480','Breast cancer ','P31749'),('2734','124200','Darier disease','P16616'),('2861','300908','Anemia, non-spherocytic hemolytic, due to G6PD deficiency ','P11413'),('3393','610938','Coronary heart disease 7','P16671'),('3753','614076','Hermansky-Pudlak syndrome 7 ','Q96EV8'),('3883','613244','Hereditary non-polyposis colorectal cancer 8 ','P16422'),('50606','101900','Acrokeratosis verruciformis ','P16422'),('5419','181500','Schizophrenia','Q9NRI5'),('5419','603342','Schizophrenia 2','Q9H0Q3'),('5419','604906','Schizophrenia 9','P49798'),('5419','604906','Schizophrenia 9','Q9NRI5'),('5419','613950','Schizophrenia 15','Q9BYB0'),('5419','615232','Schizophrenia 18','P43005'),('5420','181501','Schizophrenia','P51531'),('7148','180300','Rheumatoid arthritis','Q29980'),('9074','152700','Systemic lupus erythematosus','P31994'),('9256','114500','Colorectal cancer ','P31749'),('9256','114500','Colorectal cancer ','P84996');
/*!40000 ALTER TABLE `DOMIMAssignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DORecord`
--

DROP TABLE IF EXISTS `DORecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DORecord` (
  `DOID` varchar(11) NOT NULL COMMENT 'Each DO record is stored in the DO database using this DO ID. This is unique to the record in the database, but not unique to the MIM identifier used to find it; multiple MIM Identifiers can point to the same DOID.',
  `Disease_Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DOID`),
  KEY `fk_DORecord_DOdisease1_idx` (`Disease_Name`),
  CONSTRAINT `fk_DORecord_DOdisease1` FOREIGN KEY (`Disease_Name`) REFERENCES `DOdisease` (`Disease_Name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The DORecord table contains the identifier for disease found in the disease ontology database. This table also contains the name assigned to the disease in the D.O. database. From the name, further information on the disease can be determined, and is organized in the affiliated DOdisease table.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DORecord`
--

LOCK TABLES `DORecord` WRITE;
/*!40000 ALTER TABLE `DORecord` DISABLE KEYS */;
INSERT INTO `DORecord` VALUES ('50606','acrokeratosis verruciformis'),('12241','beta thalassemia'),('1612','breast cancer'),('1520','colon carcinoma'),('9256','colorectal cancer'),('2861','congenital nonspherocytic hemolytic anemia'),('3393','coronary artery disease'),('12971','hereditary spherocytosis'),('3753','Hermansky-Pudlak syndrome'),('2734','keratosis follicularis'),('3883','Lynch syndrome'),('7148','Rheumatoid arthritis'),('5419','schizophrenia'),('5420','schizophrenia'),('10923','sickle cell anemia'),('9074','systemic lupus erythematosus');
/*!40000 ALTER TABLE `DORecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DOdisease`
--

DROP TABLE IF EXISTS `DOdisease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOdisease` (
  `Disease_Name` varchar(100) NOT NULL COMMENT 'Any existing DO record is characterized by a disease name. ',
  `Definition` varchar(450) DEFAULT NULL COMMENT 'A DO record may or may not have a definition of the disease on its database website. ',
  `Relationship` varchar(150) DEFAULT NULL COMMENT 'A DO record may or may not have a disease relationship listed. Multiple D.O records can have the same relationship',
  PRIMARY KEY (`Disease_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The DOdisease table contains information of interest, as identified by it’s D.O. ID number. This includes the disease name, definition and relationship information.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOdisease`
--

LOCK TABLES `DOdisease` WRITE;
/*!40000 ALTER TABLE `DOdisease` DISABLE KEYS */;
INSERT INTO `DOdisease` VALUES ('acrokeratosis verruciformis','A localized disorder of keratinization affecting the distal extremities. Onset occurs early in life','is_a keratosis'),('beta thalassemia','characterized by the reduced or absent synthesis of the beta globin chains of hemoglobin. ','is_a thalassemia'),('breast cancer','A thoracic cancer that originates in the mammary gland.','is_a thoracic cancer'),('colon carcinoma','A colon cancer that has_material_basis_in abnormally proliferating cells derives_from epithelial cells.','is_a colon cancer'),('colorectal cancer','A large intestine cancer that is located_in the colon and/or located_in the rectum.','is_a large intestine cancer'),('congenital nonspherocytic hemolytic anemia','','s_a congenital hemolytic anemia'),('coronary artery disease','characterized by plaque building up along the inner walls of the arteries of the heart resulting in a narrowing of the arteries and a reduced blood supply to the cardiac muscles.','is_a artery disease'),('hereditary spherocytosis','haracterized by the production of red blood cells with a sphere shape, rather than the normal biconcave disk shape.','is_a congenital hemolytic anemia'),('Hermansky-Pudlak syndrome','An autosomal recessive disease characterized by oculocutaneous albinism, bleeding problems due to platelet storage pool defect, visual impairment and lysosomal accumulation of ceroid lipofuscin.','is_a autosomal recessive disease'),('keratosis follicularis','Autosomal dominant disorder characterized by warty papules and plaques in seborrheic areas (central trunk, flexures, scalp, and forehead), palmoplantar pits, and distinctive nail abnormalities (Sakuntabhai et al., 1999)','is_a keratosis'),('Lynch syndrome','An autosomal dominant disease that is characterized by and has_material_basis_in mutation of mismatch repair genes that increases the risk of many types of cancers.','is_a autosomal dominant disease'),('Rheumatoid arthritis','An arthritis that is an autoimmune disease which attacks healthy cells and tissue located_in joint.','is_a arthritis'),('schizophrenia','A psychotic disorder that is characterized by a disintegration of thought processes and of emotional responsiveness.','is_a psychotic disorder'),('sickle cell anemia','','is_a autosomal recessive disease'),('systemic lupus erythematosus','marked by skin rashes, joint pain and swelling, inflammation of the kidneys and inflammation of the tissue surrounding the heart.','is_a connective tissue disease, is_a lupus erythematosus');
/*!40000 ALTER TABLE `DOdisease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HGNCSynonym`
--

DROP TABLE IF EXISTS `HGNCSynonym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HGNCSynonym` (
  `Synonym` varchar(150) NOT NULL COMMENT 'Each Uniprot entry may or may not correspond to an HGNC entry with one or multiple synonyms.',
  `HGNCinfo_Approved_Symbol` varchar(15) NOT NULL,
  PRIMARY KEY (`Synonym`,`HGNCinfo_Approved_Symbol`),
  KEY `fk_HGNCSynonym_HGNCinfo1_idx` (`HGNCinfo_Approved_Symbol`),
  CONSTRAINT `fk_HGNCSynonym_HGNCinfo1` FOREIGN KEY (`HGNCinfo_Approved_Symbol`) REFERENCES `HGNCinfo` (`Approved_Symbol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='An HGNC Synonym record corresponds to one HGNCinfo record, but multiple synonyms may map to the same one HGNC info record.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HGNCSynonym`
--

LOCK TABLES `HGNCSynonym` WRITE;
/*!40000 ALTER TABLE `HGNCSynonym` DISABLE KEYS */;
INSERT INTO `HGNCSynonym` VALUES ('AKT','AKT1'),('PKB','AKT1'),('PRKBA','AKT1'),('RAC','AKT1'),('calcium pump 2','ATP2A2'),('sarcoplasmic/endoplasmic reticulum calcium ATPase 2','ATP2A2'),('SERCA2','ATP2A2'),(' SCARB3','CD36'),('FAT','CD36'),('GP3B','CD36'),('GP4','CD36'),('GPIV','CD36'),('CD35','CR1'),('KN','CR1'),(' BLOC1S8','DTNBP1'),('biogenesis of lysosomal organelles complex-1 subunit 8','DTNBP1'),('DBND','DTNBP1'),('Dysbindin','DTNBP1'),('dysbindin-1','DTNBP1'),('HPS7','DTNBP1'),('My031','DTNBP1'),('17-1A','EPCAM'),('323/A3','EPCAM'),('CD326','EPCAM'),('CO-17A','EPCAM'),('EGP-2','EPCAM'),('EGP34','EPCAM'),('EGP40','EPCAM'),('Ep-CAM','EPCAM'),('ESA','EPCAM'),('GA733-2','EPCAM'),('HEA125','EPCAM'),('KS1/4','EPCAM'),('KSA','EPCAM'),('Ly74','EPCAM'),('MH99','EPCAM'),('MK-1','EPCAM'),('MOC31','EPCAM'),('TACST-1','EPCAM'),('TROP1','EPCAM'),('CD32','FCGR2B'),('CD32B','FCGR2B'),('Fc gamma receptor IIb','FCGR2B'),('phosphohippolin','FXYD6'),('G6PD1','G6PD'),('GNASXL','GNAS'),('GPSA','GNAS'),('NESP','GNAS'),('NESP55','GNAS'),('SCG6','GNAS'),('secretogranin VI','GNAS'),('SgVI','GNAS'),('CD235a','GYPA'),('GPA','GYPA'),('MN','GYPA'),('beta-globin','HBB'),('CD113t-C','HBB'),('HBD','HBB'),('BB2','ICAM1'),('CD54','ICAM1'),('human rhinovirus receptor','ICAM1'),('PERB11.2','MICB'),('bHLHe12','NPAS3'),('MOP6','NPAS3'),('PASD6','NPAS3'),('HSPOX2','PRODH'),('PIG6','PRODH'),('PRODH1','PRODH'),('PRODH2','PRODH'),('TP53I6','PRODH'),('(none)','RGS4'),('KIAA1650','SHANK3'),('proline rich synapse associated protein 2','SHANK3'),('prosap2','SHANK3'),('PSAP2','SHANK3'),('shank postsynaptic density protein','SHANK3'),('SPANK-2','SHANK3'),('EAAC1','SLC1A1'),('EAAT3','SLC1A1'),('CD233','SLC4A1'),('FR','SLC4A1'),('Froese blood group','SLC4A1'),('RTA1A','SLC4A1'),('SW','SLC4A1'),('Swann blood group','SLC4A1'),('WR','SLC4A1'),('Wright blood group','SLC4A1'),(' BRM','SMARCA2'),(' hBRM','SMARCA2'),(' hSNF2a','SMARCA2'),(' SNF2','SMARCA2'),(' SNF2LA','SMARCA2'),(' Sth1p','SMARCA2'),(' SWI2','SMARCA2'),('BAF190','SMARCA2'),('Mal','TIRAP'),('MyD88 adapter-like','TIRAP'),('wyatt','TIRAP'),('DIF','TNF '),('TNF superfamily member2','TNF '),('TNF-alpha','TNF '),('TNFSF2','TNF ');
/*!40000 ALTER TABLE `HGNCSynonym` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HGNCTable`
--

DROP TABLE IF EXISTS `HGNCTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HGNCTable` (
  `HGNC_ID` varchar(15) NOT NULL COMMENT 'Each protein entry may or may not have an HGNC ID linking to the different database service.',
  `Approved_Symbol` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`HGNC_ID`),
  KEY `fk_HGNCTable_HGNCinfo1_idx` (`Approved_Symbol`),
  CONSTRAINT `fk_HGNCTable_HGNCinfo1` FOREIGN KEY (`Approved_Symbol`) REFERENCES `HGNCinfo` (`Approved_Symbol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='HGNC records consists of an ID to the HGNC database and the corresponding gene symbol for the entry. Information about the HGNC entry is determined from this symbol, and organized in the HGNCinfo object associated with a particular HGNCtable record.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HGNCTable`
--

LOCK TABLES `HGNCTable` WRITE;
/*!40000 ALTER TABLE `HGNCTable` DISABLE KEYS */;
INSERT INTO `HGNCTable` VALUES ('391','AKT1'),('812','ATP2A2'),('1663','CD36'),('2334','CR1'),('2888','DISC1'),('17328','DTNBP1'),('11529','EPCAM'),('29170','FAN1'),('3618','FCGR2B'),('4030','FXYD6'),('4057','G6PD'),('4392','GNAS'),('4702','GYPA'),('4827','HBB'),('5344','ICAM1'),('7091','MICB'),('19311','NPAS3'),('9453','PRODH'),('10000','RGS4'),('14294','SHANK3'),('10939','SLC1A1'),('11027','SLC4A1'),('11098','SMARCA2'),('17192','TIRAP'),('11892','TNF ');
/*!40000 ALTER TABLE `HGNCTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HGNCinfo`
--

DROP TABLE IF EXISTS `HGNCinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HGNCinfo` (
  `Approved_Symbol` varchar(15) NOT NULL COMMENT 'Each Uniprot entry may or may not correspond to an HGNC entry with an Approved symbol.',
  `Approved_Name` varchar(150) DEFAULT NULL COMMENT 'Each Uniprot entry may or may not correspond to an HGNC entry with an Approved gene name.',
  `Chromosomal_Location` varchar(45) DEFAULT NULL COMMENT 'Each Uniprot entry may or may not correspond to an HGNC entry with a chromosomal location.',
  PRIMARY KEY (`Approved_Symbol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The HGNCinfo contains 3 attributes about a gene entry on HGNC that we’re interested in: the gene symbol given to this entry, its protein name and the chromosome location to which the gene maps. An HGNC entry may also point one or more synonyms for the gene, found  in the HGNC synonym table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HGNCinfo`
--

LOCK TABLES `HGNCinfo` WRITE;
/*!40000 ALTER TABLE `HGNCinfo` DISABLE KEYS */;
INSERT INTO `HGNCinfo` VALUES ('AKT1','v-akt murine thymoma viral oncogene homolog 1','14q32.33'),('ATP2A2','ATPase; Ca++ transporting; cardiac muscle; slow twitch 2','12q24.11'),('CD36','CD36 molecule','7q11.2'),('CR1','complement component 3b/4b receptor 1 (Knops blood group)','1q32'),('DISC1','disrupted in schizophrenia 1','1q42.1'),('DTNBP1','dystrobrevin binding protein 1','6p22.3'),('EPCAM','epithelial cell adhesion molecule','2p21'),('FAN1','FANCD2/FANCI-associated nuclease 1','15q13.3'),('FCGR2B','Fc fragment of IgG receptor IIb','1q23'),('FXYD6','FXYD domain containing ion transport regulator 6','11q23.3'),('G6PD','glucose-6-phosphate dehydrogenase','Xq28'),('GNAS','GNAS complex locus','20q13.2-q13.3'),('GYPA','glycophorin A (MNS blood group)','4q31.21'),('HBB','hemoglobin subunit beta','11p15.5'),('ICAM1','intercellular adhesion molecule 1','19p13.2'),('MICB','MHC class I polypeptide-related sequence B','6p21.3'),('NPAS3','neuronal PAS domain protein 3','14q13.1'),('PRODH','proline dehydrogenase (oxidase) 1','22q11.2'),('RGS4','regulator of G-protein signaling 4','1q23.3'),('SHANK3','SH3 and multiple ankyrin repeat domains 3','22q13.3'),('SLC1A1','solute carrier family 1 (neuronal/epithelial high affinity glutamate transporter; system Xag); member 1','9p24'),('SLC4A1','solute carrier family 4 (anion exchanger); member 1 (Diego blood group)','17q21.31'),('SMARCA2','SWI/SNF related; matrix associated; actin dependent regulator of chromatin; subfamily a; member 2','9p24.3'),('TIRAP','toll-interleukin 1 receptor (TIR) domain containing adaptor protein','11q24.2'),('TNF ','tumor necrosis factor','6p21.3');
/*!40000 ALTER TABLE `HGNCinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIMDisease`
--

DROP TABLE IF EXISTS `MIMDisease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MIMDisease` (
  `Phenotype_MIM` varchar(15) NOT NULL COMMENT 'Each disease listed by MIM has an identifier number to access the disease entry in the MIM database, and to access disease entries in the disease ontology database.',
  `Uniprot_Disease_Name` varchar(250) NOT NULL COMMENT 'Uniprot may or may not list a disease name along with the MIM identifier.',
  `Uniprot_Disease Abbreviation` varchar(45) DEFAULT NULL COMMENT 'The name that Uniprot lists for an MIM disease in a uniprot entry may or may not have an abbreviation.',
  `UniprotKB_Entry` varchar(100) NOT NULL,
  PRIMARY KEY (`Phenotype_MIM`,`Uniprot_Disease_Name`,`UniprotKB_Entry`),
  KEY `fk_MIMDisease_P2P1_idx` (`UniprotKB_Entry`),
  CONSTRAINT `fk_MIMDisease_P2P1` FOREIGN KEY (`UniprotKB_Entry`) REFERENCES `P2P` (`UniprotKB_Entry`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='An MIMDisease table contains a foreign key to the P2P table, indicating the Uniprot entry page from which the disease record was obtained and its corresponding Uniprot Disease name. These are diseases that uniprot protein entries are annotated with in their pathology and biotechnology section.\nEach MIMDisease record consists of the MIM I.D, and the Uniprot disease abbreviation. This may or may not link to a corresponding Disease ontology entry, organized in the DOMIMAssignment table.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIMDisease`
--

LOCK TABLES `MIMDisease` WRITE;
/*!40000 ALTER TABLE `MIMDisease` DISABLE KEYS */;
INSERT INTO `MIMDisease` VALUES ('101900','Acrokeratosis verruciformis','AKV','P16422'),('114480','Breast cancer','BC','P31749'),('114500','Colorectal cancer','CRC','P31749'),('114500','Colorectal cancer','CRC','P84996'),('124200','Darier disease','DD','P16615'),('139320','GNAS hyperfunction','GNASHYP','P84996'),('181500','Schizophrenia','SCZD','Q9NRI5'),('181501','Schizophrenia','SCZD','P51531'),('219080','ACTH-independent macronodular adrenal hyperplasia 1','AIMAH1','P84996'),('300908','Anemia non-spherocytic hemolytic due to G6PD deficiency','NSHA','P11413'),('600850','Schizophrenia 4','SCZD4','O43272'),('601358','Nicolaides-Baraitser syndrome','NCBRS','P51531'),('603233','Pseudohypoparathyroidism 1B','PHP1B','P84996'),('603342','Schizophrenia 2','SCZD2','Q9H0Q3'),('604906','Schizophrenia 9','SCZD9','P49798'),('604906','Schizophrenia 9','SCZD9','Q9NRI5'),('606232','Phelan-McDermid syndrome','PHMDS','Q9BYB0'),('613217','Diarrhea 5 with tufting enteropathy congenital','DIAR5','P16422'),('613244','Hereditary non-polyposis colorectal cancer 8','HNPCC8','P16422'),('613950','Schizophrenia 15','SCZD15','Q9BYB0'),('614076','Hermansky-Pudlak syndrome 7','HPS7','Q96EV8'),('614817','Interstitial nephritis karyomegalic','KMIN','Q9Y2M0'),('615232','Schizophrenia 18','SCZD18','P43005');
/*!40000 ALTER TABLE `MIMDisease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `P2P`
--

DROP TABLE IF EXISTS `P2P`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `P2P` (
  `UniprotKB_Entry` varchar(100) NOT NULL COMMENT 'Uniprot ID of protein entry found when searching disease of interest. ',
  `Item_num` varchar(45) DEFAULT NULL COMMENT 'a non-natural index of all proteins; the order in which they are physically listed in the database. Corresponds uniquely to each row in P2PU table.',
  `Data_Collected_By` varchar(45) DEFAULT NULL COMMENT 'Each row in P2PU must have been collected by a person.',
  `Targeted_Disease` varchar(45) DEFAULT NULL COMMENT 'Each row in the P2PU table must have been obtained by a search targeting a disease.',
  `Protein_Name` varchar(100) DEFAULT NULL COMMENT 'Each Protein may or may not have a protein in its uniprot entry record.',
  `Sequence_Length` int(11) DEFAULT NULL COMMENT 'Each uniprot entry may or may not list protein sequence length.',
  `Mass` int(11) DEFAULT NULL COMMENT 'Each uniprot entry may or may not list protein mass, in daltons.',
  `Uniprot_Gene_Name` varchar(100) DEFAULT NULL COMMENT 'Each Uniprot entry may or may not list a gene name.',
  `HGNC_ID` varchar(15) NOT NULL,
  PRIMARY KEY (`UniprotKB_Entry`),
  KEY `fk_P2P_HGNCTable1_idx` (`HGNC_ID`),
  CONSTRAINT `fk_P2P_HGNCTable1` FOREIGN KEY (`HGNC_ID`) REFERENCES `HGNCTable` (`HGNC_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A P2P object captures defines a protein entry that is found when searching a disease of interest. It is composed of attributes selected from the Uniprot entry page of this protein.\nThis includes basic information like protein and gene name, protein sequence length and mass. It also Includes the HGNC ID of the protein, which corresponds to an record in the HGNC table.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `P2P`
--

LOCK TABLES `P2P` WRITE;
/*!40000 ALTER TABLE `P2P` DISABLE KEYS */;
INSERT INTO `P2P` VALUES ('O43272','12','G.Sop','Schizophrenia','Proline dehydrogenase 1;mitochondrial',600,68002,'PRODH','9453'),('P01375','19','G.Sop','Malaria','Tumor necrosis factor',233,25644,'TNF','11892'),('P02724','25','G.Sop','Malaria','Glycophorin-A',150,16331,'GYPA','4702'),('P02730','21','G.Sop','Malaria','Band 3 anion transport protein',911,101792,'SLC4A1','11027'),('P05362','22','G.Sop','Malaria','Intercellular adhesion molecule 1',532,57825,'ICAM1','5344'),('P11413','15','G.Sop','Malaria','Glucose-6-phosphate 1-dehydrogenase',515,59257,'G6PD','4057'),('P16422','3','s.chen','colon cancer','Epithelial cell adhesion molecule',314,34932,'EPCAM','11529'),('P16615','4','G.Sop','Schizophrenia','Sarcoplasmic/endoplasmic reticulum calcium ATPase 2',1042,114757,'ATP2A2','812'),('P16671','18','G.Sop','Malaria','Platelet glycoprotein 4',472,53053,'CD36','1663'),('P17927','23','G.Sop','Malaria','Complement receptor type 1',2039,223663,'CR1','2334'),('P31749','1','s.chen','colon cancer','RAC-alpha serine/threonine-protein kinase',480,55686,'AKT1','391'),('P31994','24','G.Sop','Malaria','Low affinity immunoglobulin gamma Fc region receptor II-b',310,34044,'FCGR2B','3618'),('P43005','11','G.Sop','Schizophrenia','Excitatory amino acid transporter 3',524,57100,'SLC1A1','10939'),('P49798','14','G.Sop','Schizophrenia','Regulator of G-protein signaling 4',205,23256,'RGS4','10000'),('P51531','7','G.Sop','Schizophrenia','Probable global transcription activator SNF2L2',1590,181279,'SMARCA2','11098'),('P58753','20','G.Sop','Malaria','Toll/interleukin-1 receptor domain-containing adapter protein',221,23883,'TIRAP','17192'),('P68871','17','G.Sop','Malaria','Hemoglobin subunit beta',147,15998,'HBB','4827'),('P84996','2','s.chen','colon cancer','Protein ALEX',626,67948,'GNAS','4392'),('Q29980','10','G.Sop','Schizophrenia','HC class I polypeptide-related sequence B',383,42646,'MICB','7091'),('Q8IXF0','13','G.Sop','Schizophrenia','Neuronal PAS domain-containing protein 3',933,100805,'NPAS3','19311'),('Q96EV8','5','G.Sop','Schizophrenia','Dysbindin',351,39493,'DTNBP1','17328'),('Q9BYB0','8','G.Sop','Schizophrenia','SH3 and multiple ankyrin repeat domains protein 3',1731,184667,'SHANK3','14294'),('Q9H0Q3','16','G.Sop','Schizophrenia','FXYD domain-containing ion transport regulator 6',95,10542,'FXYD6','4030'),('Q9NRI5','6','G.Sop','Schizophrenia','Disrupted in schizophrenia 1 protein',854,93611,'DISC1','2888'),('Q9Y2M0','9','G.Sop','Schizophrenia','Fanconi-associated nuclease 1',1017,114225,'FAN1','29170');
/*!40000 ALTER TABLE `P2P` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProtSynonym`
--

DROP TABLE IF EXISTS `ProtSynonym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProtSynonym` (
  `Alternative_Name` varchar(100) NOT NULL,
  `UniprotKB_Entry` varchar(100) NOT NULL,
  PRIMARY KEY (`Alternative_Name`,`UniprotKB_Entry`),
  KEY `fk_ProtSynonym_P2P1_idx` (`UniprotKB_Entry`),
  CONSTRAINT `fk_ProtSynonym_P2P1` FOREIGN KEY (`UniprotKB_Entry`) REFERENCES `P2P` (`UniprotKB_Entry`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table captures alternate protein names corresponding to a uniprot-based p2p entry record. A Protein synonym record stems from a P2P entry record, though multiple protein synonyms may map to the same one P2P entry record.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProtSynonym`
--

LOCK TABLES `ProtSynonym` WRITE;
/*!40000 ALTER TABLE `ProtSynonym` DISABLE KEYS */;
INSERT INTO `ProtSynonym` VALUES ('p53-induced gene 6 protein','O43272'),('Proline oxidase','O43272'),('Proline oxidase 2','O43272'),('Cachectin','P01375'),('TNF-alpha','P01375'),('Tumor necrosis factor ligand superfamily member 2','P01375'),('MN sialoglycoprotein','P02724'),('PAS-2','P02724'),('Sialoglycoprotein alpha','P02724'),('Anion exchange protein 1','P02730'),('Solute carrier family 4 member 1','P02730'),('Major group rhinovirus receptor','P05362'),('Calcium pump 2','P16615'),('Calcium-transporting ATPase sarcoplasmic reticulum type (slow twitch skeletal muscle isoform)','P16615'),('Endoplasmic reticulum class 1/2 Ca(2+) ATPase. ','P16615'),('Fatty acid translocase','P16671'),('Glycoprotein IIIb','P16671'),('Leukocyte differentiation antigen CD36','P16671'),('PAS IV','P16671'),('PAS-4','P16671'),('Platelet collagen receptor','P16671'),('Platelet glycoprotein IV','P16671'),('Thrombospondin receptor','P16671'),('C3b/C4b receptor','P17927'),('Protein kinase B','P31749'),('Protein kinase B alpha','P31749'),('Proto-oncogene c-Akt','P31749'),('RAC-PK-alpha','P31749'),('CDw32','P31994'),('Fc-gamma RII-b','P31994'),('Excitatory amino-acid carrier 1','P43005'),('Neuronal and epithelial glutamate transporter','P43005'),('Sodium-dependent glutamate/aspartate transporter 3','P43005'),('Solute carrier family 1 member 1','P43005'),('ATP-dependent helicase SMARCA2','P51531'),('BRG1-associated factor 190B','P51531'),('Protein brahma homolog','P51531'),('SNF2-alpha','P51531'),('SWI/SNF-related matrix-associated actin-dependent regulator of chromatin subfamily A member 2','P51531'),('Adaptor protein Wyatt','P58753'),('MyD88 adapter-like protein','P58753'),('Beta-globin','P68871'),('Hemoglobin beta chain','P68871'),('Basic-helix-loop-helix-PAS protein MOP6','Q8IXF0'),('Class E basic helix-loop-helix protein 12','Q8IXF0'),('Member of PAS protein 6','Q8IXF0'),('PAS domain-containing protein 6','Q8IXF0'),('Biogenesis of lysosome-related organelles complex 1 subunit 8','Q96EV8'),('BLOC-1 subunit 8','Q96EV8'),('Dysbindin-1','Q96EV8'),('Dystrobrevin-binding protein 1','Q96EV8'),('Hermansky-Pudlak syndrome 7 protein','Q96EV8'),('Proline-rich synapse-associated protein 2','Q9BYB0'),('Phosphohippolin','Q9H0Q3'),('FANCD2/FANCI-associated nuclease','Q9Y2M0'),('Myotubularin-related protein 15','Q9Y2M0');
/*!40000 ALTER TABLE `ProtSynonym` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_alternativenames`
--

DROP TABLE IF EXISTS `vw_alternativenames`;
/*!50001 DROP VIEW IF EXISTS `vw_alternativenames`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_alternativenames` AS SELECT 
 1 AS `UniprotKB_Entry`,
 1 AS `Alternative_Names`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_alternativenames_commas`
--

DROP TABLE IF EXISTS `vw_alternativenames_commas`;
/*!50001 DROP VIEW IF EXISTS `vw_alternativenames_commas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_alternativenames_commas` AS SELECT 
 1 AS `UniprotKB_Entry`,
 1 AS `Alternative_Names`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_disease_mim_count`
--

DROP TABLE IF EXISTS `vw_disease_mim_count`;
/*!50001 DROP VIEW IF EXISTS `vw_disease_mim_count`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_disease_mim_count` AS SELECT 
 1 AS `targ_dis`,
 1 AS `MIMCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_disease_protein_count`
--

DROP TABLE IF EXISTS `vw_disease_protein_count`;
/*!50001 DROP VIEW IF EXISTS `vw_disease_protein_count`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_disease_protein_count` AS SELECT 
 1 AS `Targeted_Disease`,
 1 AS `total_proteins`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_diseaseinfo`
--

DROP TABLE IF EXISTS `vw_diseaseinfo`;
/*!50001 DROP VIEW IF EXISTS `vw_diseaseinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_diseaseinfo` AS SELECT 
 1 AS `MIMDisease_Phenotype_MIM`,
 1 AS `DOID`,
 1 AS `Disease_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_geneinfo`
--

DROP TABLE IF EXISTS `vw_geneinfo`;
/*!50001 DROP VIEW IF EXISTS `vw_geneinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_geneinfo` AS SELECT 
 1 AS `HGNC_ID`,
 1 AS `Approved_Symbol`,
 1 AS `Chromosomal_Location`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_protinfo`
--

DROP TABLE IF EXISTS `vw_protinfo`;
/*!50001 DROP VIEW IF EXISTS `vw_protinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_protinfo` AS SELECT 
 1 AS `Targeted_Disease`,
 1 AS `UniprotKB_Entry`,
 1 AS `Protein_Name`,
 1 AS `Sequence_length`,
 1 AS `Alternative_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_totalmim`
--

DROP TABLE IF EXISTS `vw_totalmim`;
/*!50001 DROP VIEW IF EXISTS `vw_totalmim`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_totalmim` AS SELECT 
 1 AS `UniprotKB_Entry`,
 1 AS `targ_dis`,
 1 AS `totalMIM`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_wholeview`
--

DROP TABLE IF EXISTS `vw_wholeview`;
/*!50001 DROP VIEW IF EXISTS `vw_wholeview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_wholeview` AS SELECT 
 1 AS `UniprotKB_Entry`,
 1 AS `Protein_Name`,
 1 AS `Sequence_length`,
 1 AS `Targeted_Disease`,
 1 AS `Alternative_Names`,
 1 AS `HGNC_ID`,
 1 AS `Approved_Symbol`,
 1 AS `Chromosomal_Location`,
 1 AS `Phenotype_MIM`,
 1 AS `DOID`,
 1 AS `Disease_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_wholeview_linked`
--

DROP TABLE IF EXISTS `vw_wholeview_linked`;
/*!50001 DROP VIEW IF EXISTS `vw_wholeview_linked`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_wholeview_linked` AS SELECT 
 1 AS `UniprotKB_Entry`,
 1 AS `Protein_Name`,
 1 AS `Sequence_length`,
 1 AS `Targeted_Disease`,
 1 AS `Alternative_Names`,
 1 AS `HGNC_Id`,
 1 AS `Approved_Symbol`,
 1 AS `Chromosomal_Location`,
 1 AS `Phenotype_MIM`,
 1 AS `DOID`,
 1 AS `Disease_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'ges43_p2p'
--
/*!50003 DROP FUNCTION IF EXISTS `HTMLLink` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `HTMLLink`(ID
varchar(10),URL varchar(100)) RETURNS varchar(300) CHARSET utf8
begin
	declare Link varchar(300);
	select concat('<a href=', '"',
URL,ID,'" target="_blank"><b>', ID,
'</b>') into Link;
return Link;
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `multi_facts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `multi_facts`(IN p_QuestionId INT)
begin
	/*
	Author: Gaelle Sop-Kamga
	First Version: 04/28/2016
		
	------------------------------------------------------------------
	Purposes:Find the P2P entries that have DO disease records, and whose DO disease relationship matches a disease type input by the user.
	Inputs:dis_type
	Outputs:

	Algorithm:

	Test:
		call protein_disease_relationship(IN dis_type varchar(100));
	*/
   case p_QuestionId
		when 1 then call summarizetargetdiseases();
		when 2 then call multi_prot_name();
		when 3 then call P2PnoMIM();
	end case;
	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `multi_prot_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `multi_prot_name`()
begin
	/*
	Author: Gaelle Sop-Kamga
	First Version: 03/25/2016
		
	------------------------------------------------------------------
	Purposes:Find the P2P entries that have 2 or more alternative protein names.
	Inputs:
	Outputs:

	Algorithm:

	Test:
		call multi_prot_name();
	*/
   select a.Targeted_Disease,
	b.UniprotKB_Entry,
    a.Protein_Name,
    b.Alternative_Names
    from P2P a
    join vw_alternativenames_commas b
    on a.UniprotKB_Entry = b.UniprotKB_Entry
    where b.Alternative_Names like concat('%,%');
	/* inside the procedure, individual statements terminate with ; 
	drop table if exists payment_bk;
	create table payment_bk as
	select * from payment;
    */
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P2PnoMIM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `P2PnoMIM`()
begin
	/*
	Author: Gaelle Sop-Kamga
	First Version: 04/03/2016
		
	------------------------------------------------------------------
	Purposes:Find the P2P entries that have no related MIMDisease records.
	Inputs: 
	Outputs:

	Algorithm:

	Test:
		call P2PnoMIM();
	*/
   select a.UniprotKB_Entry,a.Targeted_Disease,a.Protein_Name,a.Protein_Name
   from P2P a
   left outer join MIMDisease
   on a.UniprotKB_Entry=MIMDisease.UniprotKB_Entry
   where MIMDisease.UniprotKB_Entry is null
   order by 1;
	/* inside the procedure, individual statements terminate with ; 
	drop table if exists payment_bk;
	create table payment_bk as
	select * from payment;
    */
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `protein_chromosome_location` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `protein_chromosome_location`(IN chrom_num varchar(3))
begin
	/*
	Author: Gaelle Sop-Kamga
	First Version: 03/31/2016
		
	------------------------------------------------------------------
	Purposes:Find the protein entries that are encoded by genes located on the user-specified chromosome
	Inputs:chrom_num
	Outputs:

	Algorithm:

	Test:
		call protein_chromosome_location(IN chrom_num varchar(2));
	*/
   select HTMLLink(a.HGNC_ID,'http://www.genenames.org/cgi-bin/gene_symbol_report?hgnc_id=HGNC:') as HGNC_ID,
    c.Targeted_Disease,
    b.Approved_Symbol,
    b.Approved_Name,
    b.Chromosomal_Location,
    c.UniprotKB_Entry,
    c.Protein_Name
    from HGNCTable a
    join HGNCinfo b
    on a.Approved_Symbol = b.Approved_Symbol
    left outer join P2P c 
    on a.HGNC_ID = c.HGNC_ID
    where b.Chromosomal_Location like concat(chrom_num,'p%')
    or b.Chromosomal_Location like concat(chrom_num,'q%');
	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `protein_disease_relationship` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `protein_disease_relationship`(IN dis_type varchar(100))
begin
	/*
	Author: Gaelle Sop-Kamga
	First Version: 03/25/2016
		
	------------------------------------------------------------------
	Purposes:Find the P2P entries that have DO disease records, and whose DO disease relationship matches a disease type input by the user.
	Inputs:dis_type
	Outputs:

	Algorithm:

	Test:
		call protein_disease_relationship(IN dis_type varchar(100));
	*/
   select HTMLLink(a.UniprotKB_Entry,'http://www.uniprot.org/uniprot/') as UniprotKB_Entry,
    a.Targeted_Disease,
    b.Disease_Name,
    b.Relationship
    from P2P a
    join MIMDisease
    on a.UniprotKB_Entry = MIMDisease.UniprotKB_Entry
    join DOMIMAssignment 
    on MIMDisease.Phenotype_MIM = DOMIMAssignment.MIMDisease_Phenotype_MIM
    and MIMDisease.Uniprot_Disease_Name= DOMIMAssignment.MIMDisease_Uniprot_Disease_Name
    and MIMDisease.UniprotKB_Entry = DOMIMAssignment.MIMDisease_UniprotKB_Entry
    join DORecord
    on DORecord.DOID = DOMIMAssignment.DOID
    join DOdisease b
    on b.Disease_Name = DORecord.Disease_Name
    where Relationship like concat('%',dis_type,'%');
	/* inside the procedure, individual statements terminate with ; 
	drop table if exists payment_bk;
	create table payment_bk as
	select * from payment;
    */
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `protein_overview` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `protein_overview`(IN uniprotkb varchar(10))
begin
	/*
	Author: Gaelle Sop-Kamga
	First Version: 04/30/2016
		
	------------------------------------------------------------------
	Purposes:list overview information about specified uniprotkb entry.
	Inputs:uniprotkb
	Outputs:

	Algorithm:

	Test:
		call protein_overview(IN uniprotkb varchar(10));
	*/
   select * from vw_wholeview_linked
    where UniprotKB_Entry like concat('%',uniprotkb,'%');
	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prot_mass` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prot_mass`(in pep_mass_min int(11), in pep_mass_max int(11))
begin
	/*
	Author: Gaelle Sop-Kamga
	First Version: 04/03/2016
		
	------------------------------------------------------------------
	Purposes:Find the P2P entries that correspond to proteins with mass greater than or equal to specified mass.
	Inputs: pep_mass
	Outputs:

	Algorithm:

	Test:
		call prot_mass(20000,60000);
	*/
   select a.Targeted_Disease,
	a.UniprotKB_Entry,
    a.Protein_Name,
    a.Mass
    from P2P a
    where a.Mass >= pep_mass_min
    and a.Mass <= pep_mass_max
	order by 1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `summarizetargetdiseases` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `summarizetargetdiseases`()
begin
/* Author: Gaelle Sop-Kamga
	First Version: 04/07/2016
		
	------------------------------------------------------------------
	Purposes:Summarize the number of proteins records and MIM records obtained for each respective targeted disease, and listed obtained uniprot IDs in a string
	Inputs: 
	Outputs:

	Algorithm:

	Test:
		call summarizetargetdiseases();
	*/
select a.Targeted_Disease, a.total_proteins as total_UniprotKB_records, b.MIMCount as total_MIM_records
from vw_disease_protein_count a
join vw_disease_mim_count b
on a.Targeted_Disease=b.targ_dis;

 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_alternativenames`
--

/*!50001 DROP VIEW IF EXISTS `vw_alternativenames`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_alternativenames` AS select `a`.`UniprotKB_Entry` AS `UniprotKB_Entry`,ifnull(group_concat(`b`.`Alternative_Name` order by `b`.`Alternative_Name` ASC separator '; '),'none') AS `Alternative_Names` from (`p2p` `a` left join `protsynonym` `b` on((`a`.`UniprotKB_Entry` = `b`.`UniprotKB_Entry`))) group by `a`.`UniprotKB_Entry` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_alternativenames_commas`
--

/*!50001 DROP VIEW IF EXISTS `vw_alternativenames_commas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_alternativenames_commas` AS select `a`.`UniprotKB_Entry` AS `UniprotKB_Entry`,ifnull(group_concat(`b`.`Alternative_Name` order by `b`.`Alternative_Name` ASC separator ', '),'none') AS `Alternative_Names` from (`p2p` `a` left join `protsynonym` `b` on((`a`.`UniprotKB_Entry` = `b`.`UniprotKB_Entry`))) group by `a`.`UniprotKB_Entry` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_disease_mim_count`
--

/*!50001 DROP VIEW IF EXISTS `vw_disease_mim_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_disease_mim_count` AS select `c`.`targ_dis` AS `targ_dis`,sum(`c`.`totalMIM`) AS `MIMCount` from `vw_totalmim` `c` group by `c`.`targ_dis` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_disease_protein_count`
--

/*!50001 DROP VIEW IF EXISTS `vw_disease_protein_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_disease_protein_count` AS select `a`.`Targeted_Disease` AS `Targeted_Disease`,count(0) AS `total_proteins` from `p2p` `a` group by `a`.`Targeted_Disease` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_diseaseinfo`
--

/*!50001 DROP VIEW IF EXISTS `vw_diseaseinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_diseaseinfo` AS select `a`.`MIMDisease_Phenotype_MIM` AS `MIMDisease_Phenotype_MIM`,`a`.`DOID` AS `DOID`,`b`.`Disease_Name` AS `Disease_Name` from (`domimassignment` `a` join `dorecord` `b` on((`a`.`DOID` = `b`.`DOID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_geneinfo`
--

/*!50001 DROP VIEW IF EXISTS `vw_geneinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_geneinfo` AS select `a`.`HGNC_ID` AS `HGNC_ID`,`a`.`Approved_Symbol` AS `Approved_Symbol`,`b`.`Chromosomal_Location` AS `Chromosomal_Location` from (`hgnctable` `a` join `hgncinfo` `b` on((`a`.`Approved_Symbol` = `b`.`Approved_Symbol`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_protinfo`
--

/*!50001 DROP VIEW IF EXISTS `vw_protinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_protinfo` AS select `a`.`Targeted_Disease` AS `Targeted_Disease`,`a`.`UniprotKB_Entry` AS `UniprotKB_Entry`,`a`.`Protein_Name` AS `Protein_Name`,`a`.`Sequence_Length` AS `Sequence_length`,`b`.`Alternative_Name` AS `Alternative_Name` from (`protsynonym` `b` join `p2p` `a` on((`b`.`UniprotKB_Entry` = `a`.`UniprotKB_Entry`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_totalmim`
--

/*!50001 DROP VIEW IF EXISTS `vw_totalmim`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_totalmim` AS select `a`.`UniprotKB_Entry` AS `UniprotKB_Entry`,`a`.`Targeted_Disease` AS `targ_dis`,count(0) AS `totalMIM` from (`p2p` `a` join `mimdisease` `b` on((`a`.`UniprotKB_Entry` = `b`.`UniprotKB_Entry`))) group by `a`.`UniprotKB_Entry` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_wholeview`
--

/*!50001 DROP VIEW IF EXISTS `vw_wholeview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_wholeview` AS select `a`.`UniprotKB_Entry` AS `UniprotKB_Entry`,`a`.`Protein_Name` AS `Protein_Name`,`a`.`Sequence_Length` AS `Sequence_length`,`a`.`Targeted_Disease` AS `Targeted_Disease`,`b`.`Alternative_Names` AS `Alternative_Names`,`c`.`HGNC_ID` AS `HGNC_ID`,`c`.`Approved_Symbol` AS `Approved_Symbol`,`d`.`Chromosomal_Location` AS `Chromosomal_Location`,`e`.`Phenotype_MIM` AS `Phenotype_MIM`,`f`.`DOID` AS `DOID`,`g`.`Disease_Name` AS `Disease_Name` from ((((((`p2p` `a` left join `vw_alternativenames` `b` on((`a`.`UniprotKB_Entry` = `b`.`UniprotKB_Entry`))) left join `hgnctable` `c` on((`a`.`HGNC_ID` = `c`.`HGNC_ID`))) left join `hgncinfo` `d` on((`c`.`Approved_Symbol` = `d`.`Approved_Symbol`))) left join `mimdisease` `e` on((`a`.`UniprotKB_Entry` = `e`.`UniprotKB_Entry`))) left join `domimassignment` `f` on(((`e`.`Phenotype_MIM` = `f`.`MIMDisease_Phenotype_MIM`) and (`e`.`Uniprot_Disease_Name` = `f`.`MIMDisease_Uniprot_Disease_Name`) and (`e`.`UniprotKB_Entry` = `f`.`MIMDisease_UniprotKB_Entry`)))) left join `dorecord` `g` on((`f`.`DOID` = `g`.`DOID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_wholeview_linked`
--

/*!50001 DROP VIEW IF EXISTS `vw_wholeview_linked`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_wholeview_linked` AS select `HTMLLink`(`a`.`UniprotKB_Entry`,'http://www.uniprot.org/uniprot/') AS `UniprotKB_Entry`,`a`.`Protein_Name` AS `Protein_Name`,`a`.`Sequence_Length` AS `Sequence_length`,`a`.`Targeted_Disease` AS `Targeted_Disease`,`b`.`Alternative_Names` AS `Alternative_Names`,`HTMLLink`(`c`.`HGNC_ID`,'http://www.genenames.org/cgi-bin/gene_symbol_report?hgnc_id=HGNC:') AS `HGNC_Id`,`c`.`Approved_Symbol` AS `Approved_Symbol`,`d`.`Chromosomal_Location` AS `Chromosomal_Location`,`e`.`Phenotype_MIM` AS `Phenotype_MIM`,`f`.`DOID` AS `DOID`,`g`.`Disease_Name` AS `Disease_Name` from ((((((`p2p` `a` left join `vw_alternativenames` `b` on((`a`.`UniprotKB_Entry` = `b`.`UniprotKB_Entry`))) left join `hgnctable` `c` on((`a`.`HGNC_ID` = `c`.`HGNC_ID`))) left join `hgncinfo` `d` on((`c`.`Approved_Symbol` = `d`.`Approved_Symbol`))) left join `mimdisease` `e` on((`a`.`UniprotKB_Entry` = `e`.`UniprotKB_Entry`))) left join `domimassignment` `f` on(((`e`.`Phenotype_MIM` = `f`.`MIMDisease_Phenotype_MIM`) and (`e`.`Uniprot_Disease_Name` = `f`.`MIMDisease_Uniprot_Disease_Name`) and (`e`.`UniprotKB_Entry` = `f`.`MIMDisease_UniprotKB_Entry`)))) left join `dorecord` `g` on((`f`.`DOID` = `g`.`DOID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-30 23:25:08
