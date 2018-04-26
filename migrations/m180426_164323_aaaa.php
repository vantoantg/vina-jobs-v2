<?php

use yii\db\Migration;

/**
 * Class m180426_164323_aaaa
 */
class m180426_164323_aaaa extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
		$this->execute("ALTER TABLE `tn_candidate` ADD COLUMN `receives` SMALLINT(1) DEFAULT 1 NULL AFTER `sorted`; ");
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m180426_164323_aaaa cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180426_164323_aaaa cannot be reverted.\n";

        return false;
    }
    */
}
