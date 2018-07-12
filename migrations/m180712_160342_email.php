<?php

use yii\db\Migration;

/**
 * Class m180712_160342_email
 */
class m180712_160342_email extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
		$this->execute("
		CREATE TABLE `tn_send_email` (
		  `id` INT (11) UNSIGNED NOT NULL AUTO_INCREMENT,
		  `send_to` VARCHAR (155) NOT NULL,
		  `send_cc` VARCHAR (155),
		  `subject` VARCHAR (255) NOT NULL,
		  `content` TEXT NOT NULL,
		  `attach` VARCHAR (255),
		  `template` VARCHAR (155),
		  `is_sent` SMALLINT (1),
		  `sent_date` DATETIME,
		  `sent_by` INT (5) DEFAULT 0,
		  `resent` INT (5),
		  `created_at` DATETIME,
		  PRIMARY KEY (`id`)
		) ENGINE = INNODB CHARSET = utf8 COLLATE = utf8_general_ci ;
		");
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m180712_160342_email cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180712_160342_email cannot be reverted.\n";

        return false;
    }
    */
}
