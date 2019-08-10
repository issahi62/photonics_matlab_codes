Reading Arbitrary Format Text Files with TEXTSCAN
This example shows how to read an arbitrary format text file with textscan. This function allows you to read the file one block at a time, and each block can have a different format.

File Format

The information in the sample text file, test80211.txt, is the result from a wireless network communication quality test. The sample file consists of 4 lines of introduction followed by several blocks of data, where each block represents a different environment (for example, mobile, indoor, outdoor). Each block of data has the following format:

Two header lines of description
The text, Num SNR=, followed by a numeric value, m
Numeric data organized in a table of m columns and an arbitrary number of rows. The data is comma-delimited.
The text, *EOB, denoting the end of the block
For example, a block of data is formatted like this:

*       Indoor2
*       SNR Vs test No
Num SNR=3
,-5.00E+00,-4.00E+00,
1.00E+00,3.32E-07,9.12E-07
2.00E+00,1.49E-07,2.44E-07
3.00E+00,6.04E-07,2.53E-07
4.00E+00,1.53E-07,4.25E-07
5.00E+00,1.82E-07,1.83E-07
6.00E+00,6.27E-07,8.21E-07
7.00E+00,9.10E-08,1.53E-08
8.00E+00,8.73E-07,6.45E-07
9.00E+00,4.40E-07,1.33E-07
*EOB
The numeric data represents error rates over a range of noise levels for a number of independent tests. The first column indicates the test number. To view the entire sample file, type at the command line:

open test80211.txt

Open Text File for Reading

fileID = fopen('test80211.txt','r');
fopen returns a file identifier.

Read Introduction Lines

Read the 4 introduction lines, which are strings delimited by a newline character.

Intro = textscan(fileID,'%s',4,'Delimiter','\n')
Intro = 

    {4x1 cell}

textscan returns a 1-by-1 cell array containing a 4-by-1 cell array of strings.

View the contents of the cell.

disp(Intro{1})
    '*CCX'
    '*CCX WiFi conformance test'
    '*CCX BER Results'
    '*CCX'

Read Each Block

For each block, we want to read a header, the numeric value m, column headers for the data, then the data itself. First, initialize the block index.

Block = 1;
Read each block of data in a while loop. The loop executes until the end of the file is reached and ~feof returns false. The textscan function returns the data in each block as a cell array named InputText. Convert each cell array to a numeric array using cell2mat and store the numeric array in a cell array named Data. A cell array allows the storage of different size blocks.

while (~feof(fileID))                               % For each block:

   fprintf('Block: %s\n', num2str(Block))           % Print block number to the screen
   InputText = textscan(fileID,'%s',2,'delimiter','\n');  % Read 2 header lines
   HeaderLines{Block,1} = InputText{1};
   disp(HeaderLines{Block});                        % Display header lines

   InputText = textscan(fileID,'Num SNR = %f');     % Read the numeric value
                                                    % following the text, Num SNR =
   NumCols = InputText{1};                          % Specify that this is the
                                                    % number of data columns

   FormatString = repmat('%f',1,NumCols);           % Create format string
                                                    % based on the number
                                                    % of columns
   InputText = textscan(fileID,FormatString, ...    % Read data block
      'delimiter',',');

   Data{Block,1} = cell2mat(InputText);
   [NumRows,NumCols] = size(Data{Block});           % Determine size of table
   disp(cellstr(['Table data size: ' ...
      num2str(NumRows) ' x ' num2str(NumCols)]));
   disp(' ');                                       % New line

   eob = textscan(fileID,'%s',1,'delimiter','\n');  % Read and discard end-of-block marker
   Block = Block+1;                                 % Increment block index
end
Block: 1
    '*       Mobile1'
    '*       SNR Vs test No'

    'Table data size: 30 x 19'

 
Block: 2
    '*       Mobile2'
    '*       SNR Vs test No'

    'Table data size: 30 x 9'

 
Block: 3
    '*       Mobile3'
    '*       SNR Vs test No'

    'Table data size: 31 x 15'

 
Block: 4
    '*       Mobile4'
    '*       SNR Vs test No'

    'Table data size: 28 x 19'

 
Block: 5
    '*       Mobile5'
    '*       SNR Vs test No'

    'Table data size: 32 x 18'

 
Block: 6
    '*       Mobile6'
    '*       SNR Vs test No'

    'Table data size: 30 x 19'

 
Block: 7
    '*       Mobile7'
    '*       SNR Vs test No'

    'Table data size: 30 x 11'

 
Block: 8
    '*       Mobile8'
    '*       SNR Vs test No'

    'Table data size: 20 x 18'

 
Block: 9
    '*       Indoor0'
    '*       SNR Vs test No'

    'Table data size: 9 x 3'

 
Block: 10
    '*       Indoor1'
    '*       SNR Vs test No'

    'Table data size: 22 x 6'

 
Block: 11
    '*       Indoor2'
    '*       SNR Vs test No'

    'Table data size: 25 x 3'

 
Block: 12
    '*       Indoor3'
    '*       SNR Vs test No'

    'Table data size: 21 x 18'

 
Block: 13
    '*       Outdoor1'
    '*       SNR Vs test No'

    'Table data size: 20 x 18'

 
Block: 14
    '*       Outdoor2'
    '*       SNR Vs test No'

    'Table data size: 23 x 3'

 
Block: 15
    '*       Outdoor3'
    '*       SNR Vs test No'

    'Table data size: 22 x 18'

 
Block: 16
    '*       Outdoor4'
    '*       SNR Vs test No'

    'Table data size: 21 x 18'

 
Block: 17
    '*       Outdoor5'
    '*       SNR Vs test No'

    'Table data size: 18 x 5'

 
Close Text File

fclose(fileID);
Total Number of Blocks

Determine the number of blocks in the file.

NumBlocks = Block-1
NumBlocks =

    17

View Numeric Data

Display the numeric data in one of the blocks using short scientific notation.

First, store the current Command Window output display format.

user_format = get(0, 'format');
Change the display format to short scientific notation.

format shortE
Display the header lines for the ninth block followed by a blank line and the numeric data.

Block = 9;
disp(HeaderLines{Block});
fprintf('SNR        %d        %d\n',Data{Block,1}(1,2:end))
disp(' ')
disp(Data{Block,1}(2:end,2:end));
    '*       Indoor0'
    '*       SNR Vs test No'

SNR        -7        -6
 
   9.0600e-07   6.7100e-07
   3.1700e-07   3.5400e-07
   2.8600e-07   1.9600e-07
   1.4800e-07   7.3400e-07
   3.9500e-08   9.6600e-07
   7.9600e-07   7.8300e-07
   4.0000e-07   8.8100e-07
   3.0100e-07   2.9700e-07

Restore the original Command Window output display format.

set(0, 'format', user_format);