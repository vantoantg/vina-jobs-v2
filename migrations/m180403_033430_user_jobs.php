<?php

use yii\db\Migration;

/**
 * Class m180403_033430_user_jobs
 */
class m180403_033430_user_jobs extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->execute("
          CREATE TABLE `tn_user_jobs` (
          `id` INT (11) UNSIGNED NOT NULL AUTO_INCREMENT,
          `user_id` INT (11),
          `jobs_id` INT (11),
          `applied` TINYINT (1) DEFAULT 0,
          `applied_time` DATETIME,
          `saved` TINYINT (1) DEFAULT 0,
          `saved_time` DATETIME,
          `arranged` INT (11) DEFAULT 1,
          `is_deleted` TINYINT (1) DEFAULT 0,
          PRIMARY KEY (`id`)
          ) ENGINE = INNODB CHARSET = utf8 COLLATE = utf8_general_ci ;CREATE TABLE `tn_user_jobs`( `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT, `user_id` INT(11), `jobs_id`            INT(11), `applied` TINYINT(1) DEFAULT 0, `applied_time` DATETIME, `saved` TINYINT(1) DEFAULT 0, `saved_time` DATETIME, `arranged` INT(11) DEFAULT 1, `is_deleted`               TINYINT(1) DEFAULT 0, PRIMARY KEY (`id`) ) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;
          ");
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m180403_033430_user_jobs cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180403_033430_user_jobs cannot be reverted.\n";

        return false;
    }
    */
}
