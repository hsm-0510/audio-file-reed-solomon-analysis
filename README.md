# audio-file-reed-solomon-analysis
The aim of this project is to study the performance of the Reed Solomon Channel Coding technique with respect to change in the SNR of the AWGN Channel.

# Problem
The aim of this project is to study the performance of the Reed Solomon Channel Coding technique with respect to change in the SNR of the AWGN Channel. The following tasks are simulated and analyzed in this article:
1.	Construction of Code Directory for RS coding technique.
2.	Analysis of the Error Correction and Detection capabilities of the code.
3.	Generation of Performance Curves of Probability of bit error v/s SNR (Eb/No) for the uncoded and coded case.

# Introduction to Reed Solomon Codes
Reed Solomon is a channel coding technique that is one of the many techniques out there. The classification of channel coding types is shown below:

![image](https://github.com/user-attachments/assets/98795c30-8179-4fef-b951-8ca11f175592)

The three major techniques of channel coding are Linear Block Coding, Convolution Coding and Cyclic Redundancy Check Codes. In the sub category of the Linear Block Coding are the Cyclic Codes, and under that category is the BCH Code whose sub type is the Reed Solomon Code. A general understanding of the Reed Solomon Code is in the sub categories that precede it.

# What is Linear Block Coding?
Linear Block Codes are a class of parity-check codes that are categorized in the (n,k) notation. Where k is the message digits and n is the codeword digits.
This coding technique has the codes in binary bits, and since it has k message bits, the possible number of distinct messages that can be created are 2^k.
The total number of codewords sequences are 2^n, of which only 2^k sequences are assigned to each message sequence.

Codewords are constructed using the following equation:

$$c(X) = m(X) * g(X)$$

Where c is the codeword, m is the message and g is the generator matrix.

The **error correction capability (t)**: of a code is the guaranteed correctable errors per codeword, defined by:

$$t = \frac{d_{min} - 1}{2}

Where d_{min} is the hamming distance between two codewords.

# What are Cyclic Codes?
This type of channel coding is an important sub-class of the Linear Block Codes. A simple description of these codes is:

“If c is a codeword, so are all cyclic shifts of c”

The nature of this type of coding method is similar to feedback shift registers. The cyclic code encoding generates parity bits via the following computation:

$$X^{n-k}m(X)⊕g(X)$$

In other words, it is the division of right shifted message polynomial by a generator polynomial. The parity polynomial is the remainder after the division.

Cyclic Codes are used for error detection via the Cyclic Redundancy Check, which is described as feedback shift registers.

# What are BCH Codes?

BCH codes are Bose-Chadhuri-Hocquenghem codes that allow multiple error correction. These are a class of cyclic codes that are very powerful, providing a large selection of block lengths, code rates, alphabet sizes and error correction capabilities.

The astonishing property of these codes are their capability of outperforming other coding methods for a block length of few hundreds with same block length and code rate.

# What are Reed Solomon Codes?

Reed Solomon code is a sub category of BCH, Cyclic and Linear Block coding. So, the properties and advantages of the above already fall under the advantages of Reed Solomon Coding as well.

The main specification of Reed Solomon (R-S) codes is that they are non-binary cyclic codes. Each symbol of message is made up of m bit sequences, where m is any positive integer greater than 2.

R-S Codes are described in the form:

$$(n,k) = (2^m - 1, 2^m - 1 - 2t)$$

Where n is the number of codewords, k is the message symbols, m is the number of bits per symbol, t is the symbol-error correcting capability, and 2t is the number of parity symbols.

The basic structure of the RS code is shown below, where the codeword symbol are divided into two major categories, Information Symbols (k) and Parity Symbols (2t) which is the redundancy.

![image](https://github.com/user-attachments/assets/32c04b5b-1bae-4689-9736-59acf23f4f2d)

**Features of RS Codes**
1. They are mainly used for Burst Error Correction.
2. Have a very high coding rate.
3. Are very low in complexity.
4. Suitable for storage and transmission applications.
5. Efficiency of error performance increases as code block size (m) increases.
6. Efficiency of error performance varies for increase in t.

# Construction of Code Directory
Reed-Solomon codes achieve the largest possible code minimum distance for any linear code with the same encoder input and output block lengths.

$$d_{min} = n - k +1$$

The code is capable of correcting any combination of t or fewer errors. An advantage of Reed-Solomon code can be seen by the following comparison. Consider a binary (n,k)=(7,3) code. The entire n-tuple space contains 2^n=2^7=128n-tuples, of which 2^k=8 (or 1/16 of the n-tuples) are codewords. This tells us that these 8 codewords has largest possible code minimum distance (3) for any linear code. Next consider a nonbinary (n,k) = (7,3) code where each symbol comprises m =3 bits. The n-tuple space amounts to 2^nm  = 2,097,152 n-tuples, of which 2^km= 29=512 (or 1/4096 of the n-tuples) are codewords.

When dealing with nonbinary symbols, each made up of m bits, only a small fraction i.e., 2^km of the large number 2^nm of possible n-tuples are codewords. This fraction decreases with increasing values of m. The important point here is that, when a small fraction of the n-tuple space is used for codewords, a large d_min can be created. R-S codes have the remarkable property that they are able to correct any set of n - k symbol.

R-S codes can be designed to have any redundancy. In linear block coding the redundancy has some limit we are using generator matrix and it gives us codewords with some parity bits we cannot set the redundancy or add so many parity bits as much as we want. It has some limit but the R-S code can be designed to have any redundancy.

However, the complexity of a high-speed implementation increases with redundancy. Thus, the most attractive RS codes have high code rates (low redundancy).

As R-S encoder need all the message bit in one time i.e., all the k bits should be sent at same time so to overcome this issue as we cannot make an array in Simulink, we call the array data from workspace using a block named “From Workspace”.

# RS Codeword Generation
We’ll be working with the following RS code in Simulink:

$$(n,k) = (2^m - 1, 2^m - 1 - 2t) = (31,23)$$

Where m=5, t=4, n=31, and k=23.

To construct the codeword for the following RS code, we’ll be using Simulink that will handle the complexity of generating the codeword. Blocks, such as the “From Workspace”, “RS Encode” and “Display” are used to construct the codeword. Below is a brief description of each block and what function they perform in generating an RS codeword.

# "From Workspace" Block
The “From Workspace” block reads data from a workspace and outputs the data as an array. The “From Workspace” icon displays the expression specified in the **Data** parameter.

First, we set the k bit value to 23. To use the array of 23 message bit, we first make an array in script with 23 value of symbol “x” as shown in below diagram.

![image](https://github.com/user-attachments/assets/b0a4e10c-8532-4341-8124-48c1ecdd5427)

The message bits are called from array “x” coded in script using the “From Workspace” block it will show the desire array by connecting display block at its output:

![image](https://github.com/user-attachments/assets/f0159f44-50eb-49ad-8eed-6b4456a3b423)

This block is responsible for taking data that we saved in the workspace via the script code written previously. The data saved in the workspace is in the form of array, hence an array is accessed in Simulink via this method.

![image](https://github.com/user-attachments/assets/38142ae7-432a-41b9-8456-c48263f7080e)

Not only this, but this method also allows us to send and receive data back and forth from Simulink to MATLAB Workspace in an easy manner, allowing us to develop a link between the different tools of MATLAB.
Once the “From Workspace” block is connected to a display, this outputs the data we input in the array in the MATLAB script:

![image](https://github.com/user-attachments/assets/be655cd9-1b7e-4d02-9033-d9ab1dad530e)

# The Reed Solomon Encoder Block

The Reed-Solomon encoder takes a block of digital data and adds extra "redundant" bits. Errors occur during transmission or storage for a number of reasons (for example noise or interference etc.).

![image](https://github.com/user-attachments/assets/10908aa3-1df6-49ab-9349-164ba78e116f)

In order to realize the encoding and decoding principles of RS codes, it is necessary to know the area of finite fields. The enormous mathematical calculations and arithmetical operations involves in the RS encoding and decoding process. Such, arithmetical calculations over a finite field with certain properties are known as Galois fields. Galois Field is a set that contains a finite number of elements and the miscellaneous operations of addition and multiplication for such sets are defined. Symbols from the extension field are used in the construction of Reed-Solomon codes. Besides the binary number 0 and 1, there are additional unique elements in the extension field that denotes the variable a. A finite set of elements, say S is formed by the element {0, 1, a} and generating additional elements by multiplying the last entry by a which yield.

The R-S encoder takes the input in array form, where all the message bits are sent at the same time. It takes the k bits i.e., 23, and generates the codeword:

$$n = 2m - 1 = 31$$

So, it added 8 parity bits in the codeword as shown in diagram:

![image](https://github.com/user-attachments/assets/528164eb-b008-43df-8951-649b98e5c42c)

We observed the codeword generation for different message bits below:

![image](https://github.com/user-attachments/assets/02cb15f5-93d8-4d9d-9ec0-cea540ef603a)

Since there are a total of:

$$ 2^{km} = 2^{23×5} = 2^{115} = 4.15×10^{34} $$

# Analysis of Error Correction and Detection

In digital systems, the analog signals will change into digital sequence (in the form of bits). This sequence of bits is called as “Data stream”. The change in position of single bit also leads to major error in data output. Almost in all electronic devices, we find errors and we use error detection and correction techniques to get the exact or approximate output. The data can be corrupted during transmission (from source to receiver). It may be affected by external noise or some other physical imperfections. In this case, the input data is not same as the received output data. This mismatched data is called “Error”. The data errors will cause loss of important / secured data. Even one bit of change in data may affect the whole system’s performance. Generally, the data transfer in digital systems will be in the form of ‘Bit – transfer’.

# Multiple Bit Data Errors

If there is change in two or more bits of data sequence of transmitter to receiver, it is called “Multiple bit error”. This type of error occurs in both serial type and parallel type data communication networks.

![image](https://github.com/user-attachments/assets/88ed8b07-d4b1-439f-a257-ab5b3c0bf6fe)

In digital communication system errors are transferred from one communication system to another, along with the data. If these errors are not detected and corrected, data will be lost. For effective communication, data should be transferred with high accuracy. This can be achieved by first detecting the errors and then correcting them.

Error detection is the process of detecting the errors that are present in the data transmitted from transmitter to receiver, in a communication system. We use some redundancy codes to detect these errors, by adding to the data while it is transmitted from source (transmitter). These codes are called “Error detecting codes”.

# Parity Checking

Parity bit means nothing but an additional bit added to the data at the transmitter before transmitting the data. Before adding the parity bit, number of 1’s or zeros is calculated in the data. Based on this calculation of data an extra bit is added to the actual information / data. The addition of parity bit to the data will result in the change of data string size. If we have message length of k so it will be calculated by the given formula:

$$k = 2^m - 1 - 2t$$

where t shows that how much errors can be corrected. If m= 5 then the message bit will be k= 23.

The R-S coding technique is not restricted to add certain amount of parity bits we can increase as much as parity as we want but remember the parity should not be larger than message bit if it happens then this will create errors in parity bits and the codeword we receive will be against the code directory we generated through this R-S coding.

# Simulation of Error Correction and Detection

Consider an event in which we get a random message bit from Random Integer Generator block it generates the following array of message bits:

![image](https://github.com/user-attachments/assets/395923eb-3083-48a0-9ffa-34aaa9c71965)

The message bits are coded using R-S encoder block and it will generate codeword of length 31 adding eight parity bits in it. As we increase the value of “t” the message k bits decrease and number of parity bits increases. The codeword that block generate is shown below:

![image](https://github.com/user-attachments/assets/fb3baaf6-d337-42be-868d-66a1a19201f9)

This codeword is transmitted to AWGN channel which a white noise channel as noises is combined in the modulated signal it will disturb the real message and when we convert it back to digital form, we get error bits this will decrease with the increase of Signal to Noise (S/N) ratio.

![image](https://github.com/user-attachments/assets/b5403574-bbda-404b-847d-83c446e1e70e)

The t=4 it means it will correct four bits that we received on the input of the decoder. The below diagram compares how message bits coded and how R-S decoder correct the error bits.

![image](https://github.com/user-attachments/assets/c9ebf6e9-e98e-4727-937e-289bf4e702c1)

Its tabular form shown below:

![image](https://github.com/user-attachments/assets/2a190510-9d6f-43a4-ae66-c458e1817fbb)

The highlighted bits tell us these are the bits which get changed when we transmitted through the AWGN channel but R-S decoder detects it and corrects it up to the range of 4, since we set t = 4. If we increase t, then more error can be corrected but to certain limits. To counter this we can increase the value of (S/N) ratio so more accurate data will be received at the output.

# Generation of Performance Curves

Performance curves in digital communication allows us to study the performance of the channel coding with respect to a changing variable. In some cases, the BER is studied against the change in m-bits of a symbol. In other cases, the BER v/s change in k-bits are studied.

In this article, we’re studying the Performance curve of BER v/s the SNR (Eb/No) of AWGN Channel for the coded and uncoded case. Which means, that we’ll be studying the error performance with varying SNR of a gaussian channel for RS coded system and uncoded system, and comparing the two results.

The main purpose of channel coding is to introduce parity symbols to the codeword, that are responsible for eliminating t errors in the codeword. When the RS coding is done, the BER v/s SNR curve should perform better than the one without the RS coding.

# Simulink Model for RS Coding & BER Performance

Simulink provides us with an excellent environment for testing the BER performance v/s SNR, because it eliminates the need for understanding the complex algorithms involved in creating a Reed Solomon codeword for a certain message symbol. Hence, Simulink is used rather than writing algorithms in MATLAB script.

![image](https://github.com/user-attachments/assets/0fdc17c0-2cc1-430e-a6d2-885b34fbebc1)

One other advantage of using Simulink over MATLAB script is the ease of changing the coding methods. If we want to study Reed Solomons Coding technique, we use the RS Encoder and Decoder blocks, and if we want to study some other technique, then we just need to replace the previous encoders and decoders with the desired ones. Above is a complete block diagram that was used for studying the BER performance curves.

In the block diagram above, it can be seen that different blocks are being used to develop an environment to study the BER performance for SNR change in AWGN channel. Each block serves a purpose, and below is their description.

# The Random Integer Generator Block

This is the first block that is being used in the Simulink model. It is responsible for generating a size k array of symbols which are of m bits.

![image](https://github.com/user-attachments/assets/b5e6444e-3490-4f75-b75b-fb5d62b1577c)

This quality of the random integer generator block, allows us to generate a random k message symbols of m bits.
The settings of the block are set accordingly:

![image](https://github.com/user-attachments/assets/63c11803-e1fb-4bd1-9324-9af2fe951f47)

We’re working with the following RS code:

$$(n,k) = (2^m - 1, 2^m - 1 - 2t) = (31, 23)$$

Where m=5, t=4, n=31, and k=2. Hence the Sample per frame is set to k equal to 23 and M-ary number is set to m=5.

# RS Encoder

This block is responsible for generating a codeword of n=31symbols. It deals with the complicated algorithm needed for RS coding. The settings of this block are set according to the figure in the next page.
The appropriate n and k values are set, along with the proper rsgenpoly(n,k) function which is responsible for working with a generator polynomial for the given n and k values.

![image](https://github.com/user-attachments/assets/bc74f51d-ad14-407d-ab54-93903ebb26a5)

# Integer to Bit Converter Block

This block is responsible to convert the codeword, which is in the form of symbols (integers), to bit form. This is a necessary step, because the information is sent through the AWGN channel in terms of bits and not symbols.

Since we have m=5 for the RS code, only the following possible symbols can be made by the random integer generator. Symbols (integers) and their respective binary representation is also given below:

![image](https://github.com/user-attachments/assets/d459d149-5b8d-43bd-acff-07502bf036a8)

The block’s settings are set as following:

![image](https://github.com/user-attachments/assets/fb50d53a-2e0f-4050-a8d4-544741ce1892)

The Number of bits per symbol are set to m=5 and the rest of the settings are left to default.

# The M-FSK Modulator Block

A modulator block is used in this model. This block is necessary, because for communication, the data is transmitted from TX to RX, but first it is modulated and converted to a continuous form. Here, we are using an FSK modulator that works on the principles of Frequency Shift Key, and its main purpose here is to convert the discrete data to continuous form for the AWGN channel.

The M-FSK is set to the following setting:

![image](https://github.com/user-attachments/assets/1495d3e1-d711-470c-bdfd-c5751c1d68b5)

The FSK Modulator operates on an input width of 32, which is an integer multiple of the bits per symbol 2^m=2^5=32. The rest of the settings are left at default.

# The AWGN Channel Block

This block is an important part of BER performance study, as it provides a noisy channel which can be varied in SNR (dB) as per the user’s choice. The AWGN channel adds gaussian or white noise to the input signal, where the input signal is of the real or complex form (continuous, not discrete). This type of noise mimics the effect of many different random disturbances that occur in the channel between TX and RX.

![image](https://github.com/user-attachments/assets/d1941ff2-e32d-4885-aad8-4624edb82715)

The main concern in this setting is the Eb/No adjustment. This setting is used to provide the different Eb/No values for which the BER is plotted for the performance curve.

# Other Blocks

After the AWGN, a demodulator, bit to integer converter and RS Decoder block is used, that serve the same purpose as the block describes previously but in the reverse process.
The Demodulator, converts the continuous modulated signal back to the discrete codeword, but this time the codeword is altered due to the noisy channel it had gone through.

The Bit to Integer converter is used to convert the bits back to the symbols so that they can be input to the RS decoder.
The RS decoder, converts the received codeword to message symbols, correcting errors that fall under its range. This block also outputs the number of errors corrected, which are studied in the previous section.

# The Error Rate Calculator Block

This block is responsible for producing three important information about the communication system. It calculates the Bit Error Rate via the TX and RX inputs, shows the no. of error bits in the codeword, and displays the total no. of codewords that were transmitted and received during the communication.
The inputs TX and RX are fed to the output of RS Encoder and Decoder respectively, which compare the original message and received message for error rate calculations.

The settings of this block are left at default, and a display is attached to its output which displays the BER, No. of errors, and total bits.

# Performance Curve Simulation for Coded & Uncoded Case

The block diagram discussed earlier is used to generate BER for different values of SNR (dB) of the AWGN channel. The SNR (dB) of the AWGN channel is varied from 0 dB to 14 dB, and the resultant BER for the Coded and Uncoded Case was linked to an excel sheet as below:

![image](https://github.com/user-attachments/assets/5bab8b99-f2d3-4956-9e3e-5f49f592181a)

# Performance Curve
![image](https://github.com/user-attachments/assets/c03fda3a-73f0-485a-8028-8b2946452f56)

The Orange curve traces the BER of Uncoded communication system. As the SNR increases, the noise component decrease, and the Bit Error Rate as a result decrease as well.
The Blue curve traces the BER of RS Coded communication system. The BER here, too decreases as SNR increases, but the rate of decrease is steeper than for the uncoded case.

This shows us that for the same noise component, there is a higher Probability of Bit Error for the uncoded case than the RS coded one. Hence, channel coding is of importance.
In terms of numbers, for an SNR of 12dB, the Probability of Bit Error for the coded case is 0.161, while for the uncoded case is 0.478, about 3 times more than the coded.
This difference in bit error increases more so when the block length of the Reed Solomon Code is increased. Since, RS codes work best in high rates, the bit error performance of the coded case increase.

# Comparison of SNR Effect on Audio File

In this section, we attempted to observe the affect a Noisy channel has when an audio file is transmitted through the AWGN channel. The audio file is a square wave of some arbitrary frequency that was pre-saved in the computer and accessed into the MATLAB script via this code.

The audio file is read via a matlab script and uploaded to the simulink model through workspace variable:
![image](https://github.com/user-attachments/assets/8306f778-952a-44ec-b6b8-bb9b01fe5c72)

The Simulink block diagram above, gathers the audio file data (which is in milli) from the workspace and converts it to the (0 to 256) range. Then data is converted to integer form and fed to the RS encoder, which converts this to a codeword.

The RS Code being used is as following:

$$(n,k)=(2^m - 1, 2^m-1-2t)=(255,155)$$

Where m=8, t=100, n=255 and k=155.

Since, k=155, the MATLAB script was set to r4=(1:156) in the code above.

The codeword then passes through the modulator, AWGN channel, demodulator, integer to bit converter and RS Decoder. At last, it goes into the “To Workspace” block which saves the transmitted data into the workspace under the name “noisy”.
Afterwards, the “noisy” data is extracted from the workspace and plotted in the Excel Sheet.

# Affect of SNR on Signal for RS Coded & Uncoded Systems

![image](https://github.com/user-attachments/assets/98523866-6e49-46c2-8995-aabbac0f54d4)

![image](https://github.com/user-attachments/assets/f54de591-c736-46e7-b1bc-409f87299fcd)

From the simulation results it became apparent, that there is a significant role that channel coding plays in eliminating errors from signals after an AWGN White noise influence. This was first studied I Part 03 of this article, and here we can observe the affects of noise in a time domain square wave signal in real time.

