<?php

use yii\db\Migration;

/**
 * Class m180502_155604_user_candidate
 */
class m180502_155604_user_candidate extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->execute("
		CREATE TABLE `tn_user_candidate` (
		  `id` INT (11) NOT NULL AUTO_INCREMENT,
		  `candidate_id` INT (11),
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
        echo "m180502_155604_user_candidate cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180502_155604_user_candidate cannot be reverted.\n";

        return false;
    }
    */
}
