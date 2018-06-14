<?php
/**
 * Created by Tona Nguyễn
 * Date: 3/7/2018
 * Time: 9:49 PM
 */
use app\library\helper\Helper;

?>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
	<meta charset="utf-8"> <!-- utf-8 works for most cases -->
	<meta name="viewport" content="width=device-width"> <!-- Forcing initial-scale shouldn't be necessary -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge"> <!-- Use the latest (edge) version of IE rendering engine -->
	<meta name="x-apple-disable-message-reformatting">  <!-- Disable auto-scale in iOS 10 Mail entirely -->
	<title><?= Helper::params() ?></title> <!-- The title tag shows in email notifications, like Android 4.4. -->

	<!-- Web Font / @font-face : BEGIN -->
	<!-- NOTE: If web fonts are not required, lines 10 - 27 can be safely removed. -->

	<!-- Desktop Outlook chokes on web font references and defaults to Times New Roman, so we force a safe fallback font. -->
	<!--[if mso]>
	<style>
		* {
			font-family: sans-serif !important;
		}
	</style>
	<![endif]-->

	<!-- All other clients get the webfont reference; some will render the font and others will silently fail to the fallbacks. More on that here: http://stylecampaign.com/blog/2015/02/webfont-support-in-email/ -->
	<!--[if !mso]><!-->
	<!-- insert web font reference, eg: <link href='https://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'> -->
	<!--<![endif]-->

	<!-- Web Font / @font-face : END -->

	<style>
		html,
		body {
			margin: 0 auto !important;
			padding: 0 !important;
			height: 100% !important;
			width: 100% !important;
		}
		* {
			-ms-text-size-adjust: 100%;
			-webkit-text-size-adjust: 100%;
		}
		div[style*="margin: 16px 0"] {
			margin: 0 !important;
		}
		table,
		td {
			mso-table-lspace: 0pt !important;
			mso-table-rspace: 0pt !important;
		}
		table {
			border-spacing: 0 !important;
			border-collapse: collapse !important;
			table-layout: fixed !important;
			margin: 0 auto !important;
		}
		table table table {
			table-layout: auto;
		}
		img {
			-ms-interpolation-mode:bicubic;
		}
		*[x-apple-data-detectors],  /* iOS */
		.x-gmail-data-detectors,    /* Gmail */
		.x-gmail-data-detectors *,
		.aBn {
			border-bottom: 0 !important;
			cursor: default !important;
			color: inherit !important;
			text-decoration: none !important;
			font-size: inherit !important;
			font-family: inherit !important;
			font-weight: inherit !important;
			line-height: inherit !important;
		}
		.a6S {
			display: none !important;
			opacity: 0.01 !important;
		}
		img.g-img + div {
			display: none !important;
		}
		.button-link {
			text-decoration: none !important;
		}
		/* iPhone 4, 4S, 5, 5S, 5C, and 5SE */
		@media only screen and (min-device-width: 320px) and (max-device-width: 374px) {
			.email-container {
				min-width: 320px !important;
			}
		}
		/* iPhone 6, 6S, 7, 8, and X */
		@media only screen and (min-device-width: 375px) and (max-device-width: 413px) {
			.email-container {
				min-width: 375px !important;
			}
		}
		/* iPhone 6+, 7+, and 8+ */
		@media only screen and (min-device-width: 414px) {
			.email-container {
				min-width: 414px !important;
			}
		}

	</style>
	<!-- CSS Reset : END -->

	<!-- Progressive Enhancements : BEGIN -->
	<style>

		/* What it does: Hover styles for buttons */
		.button-td,
		.button-a {
			transition: all 100ms ease-in;
		}
		.button-td:hover,
		.button-a:hover {
			background: #555555 !important;
			border-color: #555555 !important;
		}

		/* Media Queries */
		@media screen and (max-width: 600px) {

			.email-container {
				width: 100% !important;
				margin: auto !important;
			}

			/* What it does: Forces elements to resize to the full width of their container. Useful for resizing images beyond their max-width. */
			.fluid {
				max-width: 100% !important;
				height: auto !important;
				margin-left: auto !important;
				margin-right: auto !important;
			}

			/* What it does: Forces table cells into full-width rows. */
			.stack-column,
			.stack-column-center {
				display: block !important;
				width: 100% !important;
				max-width: 100% !important;
				direction: ltr !important;
			}
			/* And center justify these ones. */
			.stack-column-center {
				text-align: center !important;
			}

			/* What it does: Generic utility class for centering. Useful for images, buttons, and nested tables. */
			.center-on-narrow {
				text-align: center !important;
				display: block !important;
				margin-left: auto !important;
				margin-right: auto !important;
				float: none !important;
			}
			table.center-on-narrow {
				display: inline-block !important;
			}

			/* What it does: Adjust typography on small screens to improve readability */
			.email-container p {
				font-size: 17px !important;
			}
		}

	</style>
	<!-- Progressive Enhancements : END -->

	<!-- What it does: Makes background images in 72ppi Outlook render at correct size. -->
	<!--[if gte mso 9]>
	<xml>
		<o:OfficeDocumentSettings>
			<o:AllowPNG/>
			<o:PixelsPerInch>96</o:PixelsPerInch>
		</o:OfficeDocumentSettings>
	</xml>
	<![endif]-->

</head>
<body width="100%" style="margin: 0; mso-line-height-rule: exactly;">
<center style="width: 100%; text-align: left;">
	<!--[if mso | IE]>
	<table role="presentation" border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#222222">
		<tr>
			<td>
	<![endif]-->

	<!-- Email Header : BEGIN -->
	<table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" width="600" style="margin: auto;" class="email-container">
		<tr>
			<td style="padding: 10px 0; text-align: center">
				<img src="<?= Helper::siteURL() ?>/web/template/jobs/img/logo.jpg" width="72" alt="<?= Helper::params(); ?>" border="0" style="height: auto; font-family: sans-serif; font-size: 15px; line-height: 140%; color: #555555;">
			</td>
		</tr>
	</table>
	<!-- Email Header : END -->

	<!-- Email Body : BEGIN -->
	<table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" width="600" style="margin: auto;" class="email-container">

		<!-- 1 Column Text + Button : BEGIN -->
		<tr>
			<td bgcolor="#ffffff" style="padding: 40px 0px 20px; text-align: left;">
				<h1 style="margin: 0; font-family: sans-serif; font-size: 24px; line-height: 125%; color: #333333; font-weight: normal;">
                    Có một candidate vừa đăng ký trên - <?= Helper::params() ?>
				</h1>
			</td>
		</tr>
		<tr>
			<td bgcolor="#ffffff" style="padding: 0 0px 40px; font-family: sans-serif; font-size: 15px; line-height: 140%; color: #555555; text-align: left;">
				<p style="margin: 0;">Chào <b>Admin</b>! bạn vừa nhận được thông tin candidate đăng ký trên <?= Helper::params() ?> như sau:</p>
				<p style="margin: 0;">
					<b>Tên</b>: <?= $data['name'] ?><br>
					<b>Email</b>: <?= $data['email'] ?><br>
					<b>SĐT</b>: <?= $data['phone'] ?><br>
				</p>
			</td>
		</tr>
	</table>

	<table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" width="100%" style="max-width: 680px; font-family: sans-serif; color: #888888; font-size: 12px; line-height: 140%;">
		<tr>
			<td style="padding: 0px 10px; width: 100%; font-family: sans-serif; font-size: 12px; line-height: 140%; text-align: center; color: #888888;" class="x-gmail-data-detectors">
				<webversion style="color: #cccccc; text-decoration: underline; font-weight: bold;"><?= Helper::params() ?></webversion>
				<br><br>
				<?= Helper::siteURL() ?> | Tân Phú, Hồ Chí Minh | <?= Helper::params('hotline')?>
				<br><br>
				<!--<unsubscribe style="color: #888888; text-decoration: underline;">unsubscribe</unsubscribe>-->
			</td>
		</tr>
	</table>
	<!-- Email Footer : END -->

	<!-- Full Bleed Background Section : BEGIN -->
	<table role="presentation" bgcolor="#00AEEF" cellspacing="0" cellpadding="0" border="0" align="center" width="100%">
		<tr>
			<td valign="top" align="center">
				<div style="max-width: 600px; margin: auto;" class="email-container">
					<!--[if mso]>
					<table role="presentation" cellspacing="0" cellpadding="0" border="0" width="600" align="center">
						<tr>
							<td>
					<![endif]-->
					<table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
						<tr>
							<td style="padding: 15px; text-align: center; font-family: sans-serif; font-size: 15px; line-height: 140%; color: #ffffff;">
								<p style="margin: 0;">GIÚP BẠN TÌM KIẾM ỨNG VIÊN / VIỆC LÀM TRỞ NÊN DỄ DÀNG HƠN.</p>
							</td>
						</tr>
					</table>
					<!--[if mso]>
					</td>
					</tr>
					</table>
					<![endif]-->
				</div>
			</td>
		</tr>
	</table>
	<!-- Full Bleed Background Section : END -->

	<!--[if mso | IE]>
	</td>
	</tr>
	</table>
	<![endif]-->
</center>
</body>
</html>
