<?php

use yii\db\Migration;

/**
 * Class m180418_054857_tn_file_uploads
 */
class m180418_054857_tn_file_uploads extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->execute("
        CREATE TABLE `tn_file_uploads` (
          `id` INT (11) NOT NULL AUTO_INCREMENT,
          `object_type` VARCHAR (50) NOT NULL,
          `object_id` INT (11) NOT NULL,
          `file_path` VARCHAR (155),
          `file_name` VARCHAR (255),
          `file_type` VARCHAR (10),
          `created_at` DATETIME,
          `created_by` INT (11),
          `is_deleted` SMALLINT (1) DEFAULT 0,
          PRIMARY KEY (`id`)
        ) ENGINE = INNODB CHARSET = utf8 COLLATE = utf8_general_ci ;
        ");
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m180418_054857_tn_file_uploads cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180418_054857_tn_file_uploads cannot be reverted.\n";

        return false;
    }
    */
}
