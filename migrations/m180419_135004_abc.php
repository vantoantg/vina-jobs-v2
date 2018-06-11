<?php

use yii\db\Migration;

/**
 * Class m180419_135004_abc
 */
class m180419_135004_abc extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->execute("ALTER TABLE `tn_user_jobs` CHANGE `applied` `applied` SMALLINT(1) DEFAULT 0 NULL, CHANGE `saved` `saved` SMALLINT(1) DEFAULT 0 NULL, CHANGE `is_deleted` `is_deleted` SMALLINT(1) DEFAULT 0 NULL;");
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m180419_135004_abc cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180419_135004_abc cannot be reverted.\n";

        return false;
    }
    */
}
