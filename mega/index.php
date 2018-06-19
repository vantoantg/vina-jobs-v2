<?php

class Index
{
    public $num = 6;
    public $min = 1;
    public $max = 45;
    public $arr = [];

    /**
     * @return array
     */
    public function mega()
    {
        for ($i=1; $i<= $this->num; $i++) {
            $this->renderNumber();
        }

        return $this->result();
    }

    public function renderNumber()
    {
        $num = $this->getNumber();
        $this->arr[$num] = $num;
    }

    public function getNumber()
    {
        $num = $this->random();
        if (array_key_exists($num, $this->arr)) {
            return $this->getNumber();
        } else {
            return $num;
        }
    }

    public function random()
    {
        return rand($this->min, $this->max);
    }

    public function result()
    {
        ksort($this->arr);
        return $this->arr;
    }
}


$num = new Index();

$a = $num->mega();

?>
<!DOCTYPE html>
<html>
<head>
	<style>
		body {
			cursor: default;
			font-size: 14px;
			line-height: 21px;
			font-family: "Segoe UI","Helvetica",Garuda,Arial,sans-serif;
			padding: 18px 18px 18px 18px;
		}
		div{
			width: 500px;
			margin: auto;

		}
		ul {
			padding: 0;
			margin-bottom: 14px;
			list-style: none;
		}
		li { width: 50px; height: 30px;  margin: 0 0 7px 0; display: inline-block; }
		li a {
			display: block;
			width: 30px;
			height: 30px;
			margin: 0 0 7px 0;
			font-size: 18px;
			color: #333;
			padding: 5px 0 0 10px;
			text-decoration: none;
		}

		li a:hover { background-color: #EFEFEF; }

		.orange { border-left: 5px solid #F5876E; }

		.blue{ border-left: 5px solid #61A8DC; }

		.green{ border-left: 5px solid #8EBD40; }

		.purple { border-left: 5px solid #988CC3; }

		.gold { border-left: 5px solid #D8C86E; }

	</style>
</head>
<body>

<div>
	<h1>Mega</h1>
	<p>Here are the results for the next lottery.</p>
	<?php
    echo '<ul>';
    foreach ($a as $value) {
        echo '<li class="orange"><a href="#">'.$value.'</a></li>';
    }
    echo '</ul>';
    ?>
</div>

</body>
</html>



