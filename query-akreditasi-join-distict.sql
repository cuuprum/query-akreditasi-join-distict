SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA='gatokoco_eakreditas'

SELECT `COLUMN_NAME` 
FROM `INFORMATION_SCHEMA`.`COLUMNS` 
WHERE `TABLE_SCHEMA`='gatokoco_eakreditas' 
    AND `TABLE_NAME`='sesi';
	

akreditas
id
akreditas
id_sesi
id_pelatihan
created_at
nilai_1
nilai_2
nilai_3
nilai_4
nilai_5
nilai_6
nilai_7
nilai_8
total_nilai
nilai_akreditasi
masa_berlaku
tanggal_berlaku
status
updated_at
created_by
batas_edit
catatan_revisi

id
id_akreditas
nama
id_unsur
id_persyaratan
id_indikator
bobot
file
sequence
catatan
nilai
setuju_sekre
created_at
updated_at

id
id_akreditas
nama
id_unsur
id_persyaratan
id_indikator
bobot
file
sequence

id
nama
alamat
email
status
created_at
updated_at

id
nama
jabatan
eselon
type
status
created_at
updated_at

id
nama
parent_unsur
presentasi
status
created_at
updated_at

id
keterangan
bobot
status
created_at
updated_at

id_unsur
id_persyaratan
id_indikator
status
created_at
updated_at

id
keterangan
status
created_at
updated_at

id_sesi
id_user
id_balai
id_asesor
id_pelatihan
start_at
expired_at
status
created_at
updated_at

JOIN untuk dpt persyaratan berdsarkan sub unsur
SELECT DISTINCT persyaratan.id,persyaratan.keterangan
FROM unsur_persyaratan_indikator
LEFT JOIN unsur ON unsur_persyaratan_indikator.id_unsur = unsur.id
LEFT JOIN persyaratan ON unsur_persyaratan_indikator.id_persyaratan = persyaratan.id
LEFT JOIN indikator ON unsur_persyaratan_indikator.id_indikator = indikator.id
WHERE unsur_persyaratan_indikator.id_unsur = '49'

query get indikator dr persyuaratan - sbub unsir
SELECT DISTINCT
indikator.id,indikator.keterangan,indikator.bobot
FROM unsur_persyaratan_indikator
LEFT JOIN unsur ON unsur_persyaratan_indikator.id_unsur = unsur.id
LEFT JOIN persyaratan ON unsur_persyaratan_indikator.id_persyaratan = persyaratan.id
LEFT JOIN indikator ON unsur_persyaratan_indikator.id_indikator = indikator.id
WHERE unsur_persyaratan_indikator.id_unsur = '49'
	AND unsur_persyaratan_indikator.id_persyaratan = '44'
	
	

-----------------------------------

SELECT
	persyaratan.keterangan as keterangan_persyaratan,
	persyaratan.id as id_persyaratan_indikator,
	indikator.keterangan as keterangan_indikator,
	detail_akreditas.*,
    detail_akreditas_akumulasi.nilai_akreditas
FROM
	persyaratan
	JOIN unsur_persyaratan_indikator
		ON persyaratan.id = unsur_persyaratan_indikator.id_persyaratan
	LEFT JOIN detail_akreditas
		ON detail_akreditas.id = unsur_persyaratan_indikator.id_unsur AND id_akreditas = 'AKR-0068'
	LEFT JOIN indikator
		ON indikator.id = detail_akreditas.id_indikator
	LEFT JOIN detail_akreditas_akumulasi 
		ON detail_akreditas_akumulasi.id_detail_akreditas = detail_akreditas.id
GROUP BY
	unsur_persyaratan_indikator.id_persyaratan


----------------

SELECT * FROM `unsur` WHERE `presentasi` IS NOT NULL AND `presentasi` != ' ' AND `status` = 'ENABLE' AND `tipe_unsur` = 'pemerintah' AND `parent_unsur` != 0

-- GET data sub unsurt
SELECT 
	u1.id,
    u1.nama,
    u2.id,
    u2.nama
FROM `unsur` u1
	INNER JOIN `unsur` u2
    	ON u1.id = u2.parent_unsur 
WHERE u1.`presentasi` IS NOT NULL
	AND u1.`presentasi` != ' '
	AND u1.`status` = 'ENABLE'
	AND u1.`tipe_unsur` = 'pemerintah'
	AND u1.`parent_unsur` != 0
	AND u1.`presentasi` != -1











