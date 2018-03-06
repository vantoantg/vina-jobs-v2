<?php
/**
 * Created by PhpStorm.
 * User: HP570
 * Date: 1/29/2018
 * Time: 5:32 PM
 */

namespace app\models;


use PHPMailer\PHPMailer\PHPMailer;
use yii\db\Exception;

class Email
{
    public static function sendMail(){
	    $mail = new PHPMailer(true);                              // Passing `true` enables exceptions
	    try {
		    //Server settings
		    $mail->SMTPDebug = 1;                                 // Enable verbose debug output
		    $mail->isSMTP();                                      // Set mailer to use SMTP
		    $mail->Host = 'smtp.gmail.com';  // Specify main and backup SMTP servers
		    $mail->SMTPAuth = true;                               // Enable SMTP authentication
		    $mail->Username = 'vanvan.vt88@gmail.com';                 // SMTP username
		    $mail->Password = '311982057';                           // SMTP password
		    $mail->SMTPSecure = 'ssl';                            // Enable TLS encryption, `ssl` also accepted
		    $mail->Port = 587;                                    // TCP port to connect to

		    //Recipients
		    $mail->setFrom('admin@vina-jobs.com', 'Mailer');
		    $mail->addAddress('nguyennguyen.vt88@gmail.com', 'Joe User');     // Add a recipient
		    $mail->addAddress('admin@vina-jobs.com');               // Name is optional
		    $mail->addReplyTo('admin@vina-jobs.com', 'Information');
		    $mail->addCC('cc@example.com');
		    $mail->addBCC('bcc@example.com');

		    //Attachments
//		    $mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
//		    $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name

		    //Content
		    $mail->isHTML(true);                                  // Set email format to HTML
		    $mail->Subject = 'Here is the subject';
		    $mail->Body    = 'This is the HTML message body <b>in bold!</b>';
		    $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

		    $mail->send();
		    echo 'Message has been sent';
	    } catch (\PHPMailer\PHPMailer\Exception $e) {
		    echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
	    }
    }
}