<?php

use yii\db\Migration;

/**
 * Class m180328_153820_ex_data
 */
class m180328_153820_ex_data extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
		$this->execute("INSERT INTO `tn_product_category` (`name`) VALUES ('Laptop');");
		$this->execute("INSERT INTO `tn_product_category` (`name`, `arranged`) VALUES ('Desktop', '2');");
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m180328_153820_ex_data cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180328_153820_ex_data cannot be reverted.\n";

        return false;
    }
    */
}
