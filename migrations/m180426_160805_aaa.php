<?php

use yii\db\Migration;

/**
 * Class m180426_160805_aaa
 */
class m180426_160805_aaa extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->execute("ALTER TABLE `tn_candidate` CHANGE `star` `star` SMALLINT(1) DEFAULT 0 NULL, CHANGE `client_status` `client_status` SMALLINT(1) DEFAULT 1 NULL, CHANGE `status` `status` SMALLINT(1) DEFAULT 1 NULL; ");
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m180426_160805_aaa cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180426_160805_aaa cannot be reverted.\n";

        return false;
    }
    */
}
