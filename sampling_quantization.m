function [output] = sampling_quantization(image_file_gs)
%sampling_quantization()
%   input: image file name (gray scale image)
%   output: sampled image and quantized image
    
    figure; imshow(image_file_gs,[]); title('Original Image')
    %sampling, with sample rate of 10
    Fs=10;  %sampling rate
    sampled_image=image_file_gs(1:Fs:end, 1:Fs:end);
    figure; imshow(sampled_image,[]); title('Image After Sampling')
    %quantization, 5-level uniform
    levels=5;
    range=256/levels;
    [row_1, col_1]=find(sampled_image>=0 & sampled_image<=range);
    [row_2, col_2]=find(sampled_image>range & sampled_image<=(range*2));
    [row_3, col_3]=find(sampled_image>(range*2) & sampled_image<=(range*3));
    [row_4, col_4]=find(sampled_image>(range*3) & sampled_image<=(range*4));
    [row_5, col_5]=find(sampled_image>(range*4) & sampled_image<=(range*5));
    quantized_image=sampled_image;
    %below comment did not work
    %{
    quantized_image(row_1',col_1')=range/2;
    quantized_image(row_2',col_2')=(range+range*2)/2;
    quantized_image(row_3',col_3')=(range*2+range*3)/2;
    quantized_image(row_4',col_4')=(range*3+range*4)/2;
    quantized_image(row_5',col_5')=(range*4+range*5)/2;
    %}
    for i=1:1:size(row_1,1)
        quantized_image(row_1(i),col_1(i))=range/2;
    end
    for i=1:1:size(row_2,1)
        quantized_image(row_2(i),col_2(i))=(range+range*2)/2;
    end
    for i=1:1:size(row_3,1)
        quantized_image(row_3(i),col_3(i))=(range*2+range*3)/2;
    end
    for i=1:1:size(row_4,1)
        quantized_image(row_4(i),col_4(i))=(range*3+range*4)/2;
    end
    for i=1:1:size(row_5,1)
        quantized_image(row_5(i),col_5(i))=(range*4+range*5)/2;
    end
    figure; imshow(quantized_image,[]); title('Image After Both Sampling and Quantization')
    output=quantized_image; %sampled and quantized image
    %use below line in command window
    %sampling_quantization(imread('peppers.png'));
end

