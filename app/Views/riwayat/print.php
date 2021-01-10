<html>
	<head>
		<style>
			table {
			  font-family: arial, sans-serif;
			  border-collapse: collapse;
              width: 100%;
              font-size:9ox;
			}

			td, th {
			  border: 1px solid #000000;
			  text-align: center;
			  height: 20px;
			  margin: 8px;
			}

		</style>
	</head>
	<body>
		<div style="font-size:14px; color:'#dddddd'">Riwayat (<?= $title ?>)</div>
        <br>
		<table cellpadding="6" >
            <thead>
                <tr>
                    <th scope="col" width="8%">#</th>
                    <th scope="col" width="20%">Nomor Surat</th>
                    <th scope="col" width="20%">Perihal Surat</th>
                    <th scope="col" width="20%">Keterangan</th>
                    <th scope="col" width="12%">User</th>
                    <th scope="col" width="20%">Waktu</th>
                </tr>
            </thead>
            <tbody>
                <?php $i = 1; ?>
                <?php foreach ($riwayat as $d) : ?>
                    <tr>
                        <th scope="row"  width="8%"><?= $i++; ?></th>
                        <td width="20%"><?= $d['no_surat']; ?></td>
                        <td width="20%"><?= $d['perihal']; ?></td>
                        <td width="20%"><?= $d['keterangan']; ?></td>
                        <td width="12%"><?= $d['username']; ?></td>
                        <td width="20%"><?= $d['waktu']; ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
		</table>
	</body>
</html>