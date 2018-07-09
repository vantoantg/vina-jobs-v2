<?php

use yii\db\Migration;

/**
 * Class m180709_053935_newsletter
 */
class m180709_053935_newsletter extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->execute("
          CREATE TABLE `tn_news_latter` (
          `id` INT (11) NOT NULL AUTO_INCREMENT,
          `user_id` INT (11) DEFAULT 0,
          `email` VARCHAR (255) NOT NULL,
          `is_follow` SMALLINT (1) DEFAULT 1,
          `created_at` DATETIME,
          `updated_at` DATETIME,
          PRIMARY KEY (`id`)
        ) ENGINE = INNODB CHARSET = utf8 COLLATE = utf8_general_ci ;
        ");
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m180709_053935_newsletter cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180709_053935_newsletter cannot be reverted.\n";

        return false;
    }
    */
}
