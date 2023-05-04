
# Nama  : Muhammad Rifqi Fadhilah
# NRP   : 5025211228
# Kelas : Probstat (C)

# Nomor 1
# Probabilitas seorang bayi yang baru lahir berjenis kelamin laki-laki adalah 0,488.
# Jika kita asumsikan bahwa dalam satu hari di rumah sakit terdapat 10 kelahiran,
# maka:

# 1.a
# Bagaimana pendistribusian banyak bayi laki-laki? Tentukan distribusi dengan
# parameter yang sesuai.
# Jawab : 
# Dalam hal ini, distribusi yang tepat adalah distribusi binomial karena hanya 
# ada dua kemungkinan yaitu laki-laki atau perempuan. Oleh karena itu, karena 
# terdapat lebih dari satu percobaan, maka distribusinya termasuk dalam distribusi 
# binomial, bukan distribusi Bernoulli.Anda dapat menggunakan rumus berikut untuk 
# menghitung probabilitas sukses (laki-laki) sebanyak k kali dari 10 percobaan: 
# P(X=k) = (10Ck) 0.488^k (1-0.488)^(10-k)6                                             

# 1.b
# Berapa probabilitas bahwa tepat tiga bayi di antaranya berjenis kelamin lakilaki?
# Jawab : 
jumlah_sukses <- 3
probabilitas_keberhasilan <- 0.488
jumlah_percobaan <- 10

hasil <- dbinom(x = jumlah_sukses, size = jumlah_percobaan, prob = probabilitas_keberhasilan)
hasil

# 1.c
# Berapa probabilitas bahwa kurang dari tiga bayi di antaranya berjenis kelamin
# laki-laki?
# Jawab : 
jumlah_kegagalan <- 2
probabilitas_keberhasilan <- 0.488
jumlah_percobaan <- 10

hasil <- pbinom(q = jumlah_kegagalan, size = jumlah_percobaan, prob = probabilitas_keberhasilan)
hasil

# 1.d
# Berapa probabilitas bahwa tiga atau lebih bayi di antaranya berjenis kelamin
# laki-laki?
# Jawab : 
jumlah_kegagalan <- 2
probabilitas_keberhasilan <- 0.488
jumlah_percobaan <- 10
sisi_kiri <- FALSE

hasil <- pbinom(q = jumlah_kegagalan, size = jumlah_percobaan, prob = probabilitas_keberhasilan, lower.tail = sisi_kiri)
hasil

# 1.e
# Berapa nilai harapan dan simpangan baku banyak bayi laki-laki?
# Jawab : 

jumlah_data <- 10
probabilitas_keberhasilan <- 0.488
nilai_harapan <- jumlah_data * probabilitas_keberhasilan
nilai_harapan
simpangan_baku <- sqrt(jumlah_data * probabilitas_keberhasilan * (1 - probabilitas_keberhasilan))
simpangan_baku


# 1.f
# Gambarkan histogram pendistribusian banyak bayi laki-laki.
# Jawab : 
jumlah_data <- 0:10
jumlah_percobaan <- 10
probabilitas_keberhasilan <- 0.488

plot(jumlah_data, dbinom(x = jumlah_data, size = jumlah_percobaan, prob = probabilitas_keberhasilan), 
     type = 'h',
     main = 'Distribusi Binomial',
     xlab = 'Banyak bayi laki-laki',
     ylab = 'Probabilitas'
)


# Nomor 2 
# Misalkan banyak kematian karena kanker tulang untuk seluruh pekerja di pabrik
# ban dalam 20 tahun ke depan adalah 1,8

# 2.a
# Bagaimana pendistribusian banyak kematian karena kanker tulang? Tentukan
# distribusi dengan parameter yang sesuai.
# Jawab : 

# Distribusi yang tepat untuk kasus ini adalah distribusi Poisson, karena kejadian 
# tersebut terjadi pada lingkup ruang dan waktu tertentu. Rumus probabilitas distribusi
# Poisson adalah P(X=k) = e^(-λ) (λ^k / k!)

# 2.b
# Ada 4 kematian akibat kanker tulang yang dilaporkan di kalangan pekerja
# pabrik ban, apakah itu peristiwa yang tidak biasa? Hitung probabilitas
# berdasarkan distribusi yang telah dipilih.

# Jawab : 
# Kejadian ini dapat dikategorikan sebagai kejadian yang tidak biasa, meskipun 
# tidak terlalu jarang. Hal ini disebabkan karena kemungkinan terjadinya tidak 
# terlalu berbeda jauh dengan kemungkinan terjadinya di sekitar nilai rata-rata (λ).

jumlah_kejadian <- 4
rata_rata_kejadian <- 1.8
hasil_probabilitas <- dpois(x = jumlah_kejadian, lambda = rata_rata_kejadian)
hasil_probabilitas


# 2.c
# Berapa peluang paling banyak 4 kematian akibat kanker tulang?

# Jawab : 
jumlah_kejadian <- 4
rata_rata_kejadian <- 1.8
hasil_probabilitas_kumulatif <- ppois(q = jumlah_kejadian, lambda = rata_rata_kejadian)
hasil_probabilitas_kumulatif

# 2.d
# Berapa peluang lebih dari 4 kematian akibat kanker tulang?

# Jawab : 
jumlah_kejadian <- 4
rata_rata_kejadian <- 1.8
sisi_kiri <- FALSE
hasil_probabilitas_kumulatif <- ppois(q = jumlah_kejadian, lambda = rata_rata_kejadian, lower.tail = sisi_kiri)
hasil_probabilitas_kumulatif

# 2.e
# Berdasarkan distribusi yang telah dipilih, berapakah nilai harapan dan standar
# deviasi banyak kematian akibat kanker tulang untuk pekerja pabrik ban?

# Jawab : 

nilai_harapan <- 1.8
print(nilai_harapan)
standar_deviasi <- 1.8^0.5
print(standar_deviasi)

# 2.f
# Gambarkan histogram pendistribusian banyak banyak kematian akibat kanker
# tulang untuk pekerja pabrik ban.

# Jawab : 

n <- seq(0, 10)
lambda <- 1.8
plot(n, dpois(n, lambda),
     type='h',
     main='Distribusi Poisson',
     ylab='Probabilitas',
     xlab ='Banyak kejadian'
)


# 2.g
# Gunakan simulasi untuk memeriksa hasil sebelumnya.
# Jawab :

n <- 10
lambda <- 1.8
set.seed(123456789)
ans <- replicate(n, rpois(n=1, lambda=lambda))
ans <- unlist(ans)
ans


# 2.h
# Jelaskan banyak kematian akibat kanker tulang berdasarkan simulasi Anda.
# Bandingkan jawaban pada pertanyaan 2d dengan hasil simulasi Anda.
# Jawab :

# Dalam simulasi ini dengan set.seed(123456789) dan jumlah simulasi n = 10, 
#iperoleh hasil [2,2,2,2,4,4,1,4,1,1]. Hasil yang muncul memang beragam, tetapi 
#tidakterlalu jauh dari nilai lambda/mean yaitu 1.8 karena kemungkinan terbesar 
#kematianterjadi pada daerah dekat lambda, yaitu rentang 0-5. Seperti pada jawaban 2d, 
#kejadiankematian = 4 bukanlah hal yang biasa, namun juga tidak sangat jarang terjadi.
#Hal ini dapat dibuktikan dengan kemunculan yang cukup sering pada simulasi 
#(walaupun tergantung pada seed pada simulasi). Jumlah kematian yang paling sering 
#terjadi adalah sekitar 1 atau 2 setelah dibandingkan dengan beberapa seed lain

# Nomor 3

# Diketahui nilai x = 3 dan v = 10. Tentukan:

# 3.a
# Fungsi probabilitas dari distribusi Chi-Square

# Jawab : 
x <- 3
v <- 10
ans <- dchisq(x=x, df=v)
ans

# 3.b
# Histogram dari distribusi Chi-Square dengan 500 data acak.

# Jawab : 
set.seed(123456789)
n <- 500
v <- 10
x <- rchisq(n, v)
hist(x, xlab = "X", ylab = "Jumlah", main = "Histogram Chi-Square")

# 3.c
# Nilai rataan (μ) dan varian (σ²) dari distribusi Chi-Square

# Jawab : 
mean <- v <- 10
mean
variance <- 2 * v
variance


# Nomor 4
# Diketahui data bangkitan acak sebanyak 100 dengan mean = 45 dan sd = 5.
# Tentukan:

# 4.a
# Fungsi probabilitas dari distribusi Normal P(X1 ≤ x ≤ X2), hitung z-scorenya
# dan plot data bangkitan acaknya dalam bentuk grafik. Petunjuk (gunakan fungsi plot()).

# Jawab : 

# f(x) = (1/5√(2π)) e^(-1/2((x-45)/5)^2)

set.seed(123456789)
n <- 100
mean <- 45
sd <- 5
data <- rnorm(n=n, mean=mean, sd=sd)
data
summary(data)
z_scores <- scale(data)
z_scores
probs <- pnorm(runif(1, mean, max(data)), mean, sd) - pnorm(runif(1, min(data), mean), mean, sd)
probs
plot(data)


# 4.b
# Gambarkan histogram dari distribusi Normal dengan breaks 50

# Jawab : 
set.seed(123456789)
n <- 100
mean <- 45
sd <- 5
data <- rnorm(n=n, mean=mean, sd=sd)
breaks = 50
hist(data, breaks, main = "Histogram distribusi normal")

# 4.c
# Nilai varian (σ²) dari hasil data bangkitan acak distribusi Normal.\

# Jawab : 
set.seed(123456789)
n <- 100
mean <- 45
sd <- 5
data <- rnorm(n=n, mean=mean, sd=sd)
varian <- var(data)
varian


# Nomor 5
# Kerjakanlah menggunakan distribusi T-Student

# 5.a
# Berapa probabilitas terjadinya suatu peristiwa acak X kurang dari -2,34 dengan
# 6 derajat kebebasan?

# Jawab : 
q <- -2.34
df <- 6
ans <- pt(q=q, df=df)
ans

# 5.b
# Berapa probabilitas terjadinya suatu peristiwa acak X lebih dari 1,34 dengan 6
# derajat kebebasan?

# Jawab :   
q <- 1.34
df <- 6
left = FALSE
ans <- pt(q=q, df=df, lower.tail = left)
ans

# 5.c
# Berapa probabilitas terjadinya suatu peristiwa acak X kurang dari -1,23 atau
# lebih besar dari 1,23 dengan 3 derajat kebebasan?

# Jawab : 
q <- -1.23
df <- 3
ans <- 2 * pt(q=q, df=df)
ans

# 5.d
# Berapa probabilitas terjadinya suatu peristiwa acak X berada di antara -0,94
# dan 0,94 dengan 14 derajat kebebasan?

# Jawab : 
q <- -0.94
df <- 14
ans <- 1 - ( 2 * pt(q=q, df=df))
ans

# 5.e
# Berapa nilai t-score dengan 5 derajat kebebasan yang memiliki luasan 0,0333
# satuan persegi di bawah kurva dan di sebelah kiri t-score tersebut?

# Jawab :
x <- 0.0333
df <- 5
ans <- qt(x, df=df)
ans


# 5.f
# Berapa nilai t-score dengan 25 derajat kebebasan yang memiliki luasan 0,125
# satuan persegi di bawah kurva dan di sebelah kanan t-score tersebut?

# Jawab : 
x <- 1 - 0.125
df <- 25
ans <- qt(x, df=df)
ans

# 5.g
# Berapa nilai t-score dengan 11 derajat kebebasan yang memiliki luasan 0,75
# satuan persegi di bawah kurva dan di antara t-score tersebut dan negatif dari
# nilai t-score tersebut?

# Jawab : 
x <- 0.75 + ((1-0.75)/2)
df <- 11
ans <- qt(x, df=df)
ans

# 5.h
# Berapa nilai t-score dengan 23 derajat kebebasan yang memiliki luasan 0,0333
# satuan persegi di bawah kurva dan di luar interval antara t-score tersebut dan
# negatif dari nilai t-score tersebut?

# Jawab : 
x <- 1 - (0.0333/2)
df <- 23
ans <- qt(x, df=df)
ans
