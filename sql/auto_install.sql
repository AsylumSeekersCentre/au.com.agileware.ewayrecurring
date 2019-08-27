-- +--------------------------------------------------------------------+
-- | CiviCRM version 5                                                  |
-- +--------------------------------------------------------------------+
-- | Copyright CiviCRM LLC (c) 2004-2019                                |
-- +--------------------------------------------------------------------+
-- | This file is a part of CiviCRM.                                    |
-- |                                                                    |
-- | CiviCRM is free software; you can copy, modify, and distribute it  |
-- | under the terms of the GNU Affero General Public License           |
-- | Version 3, 19 November 2007 and the CiviCRM Licensing Exception.   |
-- |                                                                    |
-- | CiviCRM is distributed in the hope that it will be useful, but     |
-- | WITHOUT ANY WARRANTY; without even the implied warranty of         |
-- | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.               |
-- | See the GNU Affero General Public License for more details.        |
-- |                                                                    |
-- | You should have received a copy of the GNU Affero General Public   |
-- | License and the CiviCRM Licensing Exception along                  |
-- | with this program; if not, contact CiviCRM LLC                     |
-- | at info[AT]civicrm[DOT]org. If you have questions about the        |
-- | GNU Affero General Public License or the licensing of CiviCRM,     |
-- | see the CiviCRM license FAQ at http://civicrm.org/licensing        |
-- +--------------------------------------------------------------------+
--
-- Generated from schema.tpl
-- DO NOT EDIT.  Generated by CRM_Core_CodeGen
--


-- +--------------------------------------------------------------------+
-- | CiviCRM version 5                                                  |
-- +--------------------------------------------------------------------+
-- | Copyright CiviCRM LLC (c) 2004-2019                                |
-- +--------------------------------------------------------------------+
-- | This file is a part of CiviCRM.                                    |
-- |                                                                    |
-- | CiviCRM is free software; you can copy, modify, and distribute it  |
-- | under the terms of the GNU Affero General Public License           |
-- | Version 3, 19 November 2007 and the CiviCRM Licensing Exception.   |
-- |                                                                    |
-- | CiviCRM is distributed in the hope that it will be useful, but     |
-- | WITHOUT ANY WARRANTY; without even the implied warranty of         |
-- | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.               |
-- | See the GNU Affero General Public License for more details.        |
-- |                                                                    |
-- | You should have received a copy of the GNU Affero General Public   |
-- | License and the CiviCRM Licensing Exception along                  |
-- | with this program; if not, contact CiviCRM LLC                     |
-- | at info[AT]civicrm[DOT]org. If you have questions about the        |
-- | GNU Affero General Public License or the licensing of CiviCRM,     |
-- | see the CiviCRM license FAQ at http://civicrm.org/licensing        |
-- +--------------------------------------------------------------------+
--
-- Generated from drop.tpl
-- DO NOT EDIT.  Generated by CRM_Core_CodeGen
--
-- /*******************************************************
-- *
-- * Clean up the exisiting tables
-- *
-- *******************************************************/

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `civicrm_ewayrecurring`;
DROP TABLE IF EXISTS `civicrm_contribution_page_recur_cycle`;
DROP TABLE IF EXISTS `civicrm_eway_contribution_transactions`;

SET FOREIGN_KEY_CHECKS=1;
-- /*******************************************************
-- *
-- * Create new tables
-- *
-- *******************************************************/

CREATE TABLE `civicrm_ewayrecurring` (
     `processor_id` int(10) NOT NULL,
     `cycle_day`    int(2)  DEFAULT NULL,
     PRIMARY KEY(`processor_id`)
     ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `civicrm_contribution_page_recur_cycle` (
     `page_id`   int(10) NOT NULL DEFAULT '0',
     `cycle_day` int(2)  DEFAULT NULL,
     PRIMARY KEY (`page_id`)
     ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `civicrm_eway_contribution_transactions` (
     `id`                   int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique EwayContributionTransactions ID',
     `contribution_id`      int unsigned                         COMMENT 'FK to Contact',
     `payment_processor_id` int unsigned                         COMMENT 'FK to PaymentProcessor',
     `access_code`          text,
     `failed_message`       text         DEFAULT NULL,
     `status`               int unsigned DEFAULT 0 ,
     `tries`                int unsigned DEFAULT 0,
     `is_email_receipt`     tinyint(1)   DEFAULT 1,
     PRIMARY KEY (`id`),
     CONSTRAINT FK_civicrm_eway_contribution_transactions_contribution_id
                FOREIGN KEY (`contribution_id`)
                REFERENCES `civicrm_contribution`(`id`)
                ON DELETE CASCADE,
     CONSTRAINT FK_civicrm_eway_contribution_transactions_payment_processor_id
                FOREIGN KEY (`payment_processor_id`)
                REFERENCES `civicrm_payment_processor`(`id`)
                ON DELETE CASCADE
     ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
