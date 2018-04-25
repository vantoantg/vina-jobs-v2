<?php

use yii\db\Migration;

/**
 * Class m180425_152436_modify
 */
class m180425_152436_modify extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
		$this->execute("ALTER TABLE `tn_candidate` CHANGE `location` `location` VARCHAR(255) NULL; ");
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m180425_152436_modify cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180425_152436_modify cannot be reverted.\n";

        return false;
    }
    */
}
