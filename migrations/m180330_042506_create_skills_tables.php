<?php

use yii\db\Migration;

/**
 * Class m180330_042506_create_skills_tables
 */
class m180330_042506_create_skills_tables extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('tn_job_skill', [
            'id' => $this->primaryKey(),
            'categories_id' => $this->integer()->notNull(),
            'name' => $this->string(),
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('tn_job_skill');
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180330_042506_create_skills_tables cannot be reverted.\n";

        return false;
    }
    */
}
