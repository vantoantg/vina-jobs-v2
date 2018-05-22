<?php
/**
 * Created by Tona Nguyễn
 * Date: 1/29/2018
 * Time: 5:32 PM
 */

namespace app\models;


use app\library\helper\Helper;
use PHPMailer\PHPMailer\PHPMailer;
use yii\db\Exception;

/**
 * Class Email
 * @package app\models
 *
 * Tona DOC:
 * Setting gmail become mailserver: https://myaccount.google.com/u/1/apppasswords?rapt=AEjHL4O3T2Xk2UwwABN-Ca9GaqNigTxOSJhaTVOmee4otcVVKU65s9SflsgQRpoKde55TnFXjqZfvJHxvULa4uVQAKkWEMis_A
 * + Create new password for account https://support.google.com/accounts/answer/185833
 * Ex: vanvan.vt88@gmail.com / anwizqatmdosqwlt
 */
class Email
{
	/**
	 * @param string $subject
	 * @param $body
	 * @param string $toEmail
	 * @param string $toName
	 * @return bool
	 */
    public static function sendMail(
    	$subject = 'Subject',
	    $body,
	    $toEmail = 'nguyennguyen.vt88@gmail.com',
	    $toName = 'Tona Nguyễn')
    {
	    $mail = new PHPMailer();                              // Passing `true` enables exceptions
	    try {
	    	$m = \Yii::$app->params['mail'];
		    $mail->SMTPDebug = 0;
	        if(YII_DEBUG){
                //Server settings
                $mail->SMTPDebug = 1;
            }
            // Enable verbose debug output
		    $mail->isSMTP();                                      // Set mailer to use SMTP
		    $mail->Host = $m['host'];  // Specify main and backup SMTP servers
		    $mail->SMTPAuth = true;                               // Enable SMTP authentication
		    $mail->Username = $m['username'];                 // SMTP username
		    $mail->Password = $m['password'];                           // SMTP password
		    $mail->SMTPSecure = $m['secure'];                            // Enable TLS encryption, `ssl` also accepted
		    $mail->Port = $m['port'];                                    // TCP port to connect to

		    //Recipients
		    $mail->setFrom($m['options']['setFrom'], \Yii::$app->params['siteName']);
		    $mail->addAddress($toEmail, $toName);     // Add a recipient
//		    $mail->addAddress('admin@vina-jobs.com');               // Name is optional
		    $mail->addReplyTo($m['options']['addReplyTo'], 'noreply');
		    $mail->addCC(Helper::params('adminEmail'));
//		    $mail->addBCC('bcc@example.com');

		    //Attachments
//		    $mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
//		    $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name

		    //Content
		    $mail->isHTML(true);                                  // Set email format to HTML
		    $mail->Subject = $subject;
		    $mail->Body    = $body;
		    $mail->AltBody = $body;

		    $mail->send();
		    return true;
	    } catch (\PHPMailer\PHPMailer\Exception $e) {
		    echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
	    }
    }

	public static function sendMailApply($subject = 'Apply', $body, $toEmail = '', $toName = '', $attachment = false){
		$mail = new PHPMailer();                              // Passing `true` enables exceptions
		try {
			$m = \Yii::$app->params['mail'];
			$mail->SMTPDebug = 0;
			if(YII_DEBUG){
				$mail->SMTPDebug = 1;
			}
			$mail->isSMTP();                                      // Set mailer to use SMTP
			$mail->Host = $m['host'];  // Specify main and backup SMTP servers
			$mail->SMTPAuth = true;                               // Enable SMTP authentication
			$mail->Username = $m['username'];                 // SMTP username
			$mail->Password = $m['password'];                           // SMTP password
			$mail->SMTPSecure = $m['secure'];                            // Enable TLS encryption, `ssl` also accepted
			$mail->Port = $m['port'];                                    // TCP port to connect to

			//Recipients
			$mail->setFrom($m['options']['setFrom'], \Yii::$app->params['siteName']);
			$mail->addAddress($toEmail, $toName);     // Add a recipient
//		    $mail->addAddress('admin@vina-jobs.com');               // Name is optional
			$mail->addReplyTo($m['options']['addReplyTo'], 'noreply');
//		    $mail->addCC('cc@example.com');
//		    $mail->addBCC('bcc@example.com');

			//Attachments
			if($attachment){
				$mail->addAttachment($attachment);         // Add attachments /var/tmp/file.tar.gz
			}
//		    $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name

			//Content
			$mail->isHTML(true);                                  // Set email format to HTML
			$mail->Subject = $subject;
			$mail->Body    = $body;
			$mail->AltBody = $body;

			$mail->send();
			return true;
		} catch (\PHPMailer\PHPMailer\Exception $e) {
			echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
		}
	}

    public function validateRmailType()
    {

    }

    public static function body()
    {

    }
}