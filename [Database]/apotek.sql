/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.1.39-MariaDB : Database - apotek
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`apotek` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `apotek`;

/*Table structure for table `aktivitas` */

DROP TABLE IF EXISTS `aktivitas`;

CREATE TABLE `aktivitas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_user` varchar(20) NOT NULL,
  `aktivitas` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `aktivitas` */

/*Table structure for table `barang` */

DROP TABLE IF EXISTS `barang`;

CREATE TABLE `barang` (
  `id` varchar(50) NOT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_kategori` (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `barang` */

/*Table structure for table `detail_transaksi` */

DROP TABLE IF EXISTS `detail_transaksi`;

CREATE TABLE `detail_transaksi` (
  `id_detail_transaksi` int(11) NOT NULL AUTO_INCREMENT,
  `id_transaksi` int(11) DEFAULT NULL,
  `id_stok` varchar(50) DEFAULT NULL,
  `harga` int(50) DEFAULT NULL,
  `qty` int(50) DEFAULT NULL,
  `total` int(50) DEFAULT NULL,
  PRIMARY KEY (`id_detail_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detail_transaksi` */

/*Table structure for table `kategori` */

DROP TABLE IF EXISTS `kategori`;

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kategori` */

/*Table structure for table `level` */

DROP TABLE IF EXISTS `level`;

CREATE TABLE `level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_level` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `level` */

insert  into `level`(`id`,`nama_level`) values 
(1,'Admin'),
(2,'Karyawan');

/*Table structure for table `stok` */

DROP TABLE IF EXISTS `stok`;

CREATE TABLE `stok` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `stok_masuk` int(11) DEFAULT NULL,
  `stok_sekarang` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `harga` int(50) DEFAULT NULL,
  `id_barang` varchar(50) DEFAULT NULL,
  `id_supplier` varchar(10) DEFAULT NULL,
  `kadaluarsa` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `stok` */

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `id_supplier` varchar(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `telepon` varchar(12) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `supplier` */

/*Table structure for table `transaksi` */

DROP TABLE IF EXISTS `transaksi`;

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_invoice` varchar(50) DEFAULT NULL,
  `tgl_transaksi` date DEFAULT NULL,
  `jam_transaksi` varchar(10) DEFAULT NULL,
  `total_bayar` int(50) DEFAULT NULL,
  `jumlah_bayar` int(50) DEFAULT NULL,
  `kembalian` int(50) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transaksi` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `nomor` varchar(20) DEFAULT NULL,
  `alamat` text,
  `id_level` int(11) DEFAULT NULL,
  `gambar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`nama`,`nomor`,`alamat`,`id_level`,`gambar`) values 
(1,'admin','admin','admin',NULL,NULL,1,'1587434500NekoDesz1.png');

/*Table structure for table `menipis` */

DROP TABLE IF EXISTS `menipis`;

/*!50001 DROP VIEW IF EXISTS `menipis` */;
/*!50001 DROP TABLE IF EXISTS `menipis` */;

/*!50001 CREATE TABLE  `menipis`(
 `stok_total` decimal(32,0) ,
 `nama` varchar(100) ,
 `supplier` varchar(30) ,
 `stok_masuk` int(11) ,
 `id` int(50) ,
 `stok_sekarang` int(11) ,
 `tanggal` date ,
 `kadaluarsa` date ,
 `harga` int(50) 
)*/;

/*View structure for view menipis */

/*!50001 DROP TABLE IF EXISTS `menipis` */;
/*!50001 DROP VIEW IF EXISTS `menipis` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `menipis` AS select sum(`stok`.`stok_sekarang`) AS `stok_total`,`barang`.`nama` AS `nama`,`supplier`.`nama` AS `supplier`,`stok`.`stok_masuk` AS `stok_masuk`,`stok`.`id` AS `id`,`stok`.`stok_sekarang` AS `stok_sekarang`,`stok`.`tanggal` AS `tanggal`,`stok`.`kadaluarsa` AS `kadaluarsa`,`stok`.`harga` AS `harga` from ((`stok` join `barang` on((`barang`.`id` = `stok`.`id_barang`))) join `supplier` on((`supplier`.`id_supplier` = `stok`.`id_supplier`))) group by `stok`.`id_barang` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
