<?php

use yii\db\Migration;

/**
 * Class m180607_151858_cv_end_date
 */
class m180607_151858_cv_end_date extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
		$this->execute("ALTER TABLE `tn_jobs` ADD COLUMN `cv_end_date` DATE NULL AFTER `content`; ");
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m180607_151858_cv_end_date cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180607_151858_cv_end_date cannot be reverted.\n";

        return false;
    }
    */
}
