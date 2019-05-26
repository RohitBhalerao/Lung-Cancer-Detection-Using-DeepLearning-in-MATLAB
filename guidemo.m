function varargout = guidemo(varargin)
% GUIDEMO MATLAB code for guidemo.fig
%      GUIDEMO, by itself, creates a new GUIDEMO or raises the existing
%      singleton*.
%
%      H = GUIDEMO returns the handle to a new GUIDEMO or the handle to
%      the existing singleton*.
%
%      GUIDEMO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDEMO.M with the given input arguments.
%
%      GUIDEMO('Property','Value',...) creates a new GUIDEMO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guidemo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guidemo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guidemo

% Last Modified by GUIDE v2.5 23-Jan-2019 10:39:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guidemo_OpeningFcn, ...
                   'gui_OutputFcn',  @guidemo_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before guidemo is made visible.
function guidemo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guidemo (see VARARGIN)

% Choose default command line output for guidemo
handles.output = hObject;
    label='0';
set(handles.edit1,'String',label);clc
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guidemo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guidemo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Preprocessing.
function Preprocessing_Callback(hObject, eventdata, handles)
% hObject    handle to Preprocessing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;

filename='.jpg';
filename1='.png';
datapath=pwd;
string1='\beningn\';
string2='\malign\';
string3='\normal\';


for i=1:210
            
    filename2=strcat(num2str(i),filename);
    filename2=strcat(datapath,string1,filename2);
    filename3=strcat(num2str(i),filename1);
    a=imread(filename2);
    b=rgb2gray(a);
    c=b>150;
    c=medfilt2(c,[3 3]);
    se = strel('sphere',30);
    dilatedBW = imdilate(c, se);
    L = watershed_old(dilatedBW,1);
    L1=L.*dilatedBW;
    PreprocessesImages=zeros(512,512,3);
    PreprocessesImages(55:480,1:512,1)=a(55:480,1:512,1);
    PreprocessesImages(55:480,1:512,2)=a(55:480,1:512,2);
    PreprocessesImages(55:480,1:512,3)=a(55:480,1:512,3);
    a=double(PreprocessesImages);
    Inewc = a.*repmat(dilatedBW,[1,1,3]);
    PreprocessesImages=imresize(Inewc,[227 227]);
    PreprocessesImages=uint8(PreprocessesImages);
    cd 'PreprocessedDatabase\beningn'
    imwrite(PreprocessesImages,filename3);
    cd ..
    cd ..
end


for i=1:210
    
    filename2=strcat(num2str(i),filename);
    filename2=strcat(datapath,string3,filename2);
    filename3=strcat(num2str(i),filename1);
    a=imread(filename2);
     b=rgb2gray(a);
    c=b>150;
    c=medfilt2(c,[3 3]);
    se = strel('sphere',30);
    dilatedBW = imdilate(c, se);
    L = watershed_old(dilatedBW,1);
    L1=L.*dilatedBW;
    PreprocessesImages=zeros(512,512,3);
    PreprocessesImages(55:480,1:512,1)=a(55:480,1:512,1);
    PreprocessesImages(55:480,1:512,2)=a(55:480,1:512,2);
    PreprocessesImages(55:480,1:512,3)=a(55:480,1:512,3);
    a=double(PreprocessesImages);
    Inewc = a.*repmat(dilatedBW,[1,1,3]);
    PreprocessesImages=imresize(Inewc,[227 227]);
    PreprocessesImages=uint8(PreprocessesImages);
    cd 'PreprocessedDatabase\normal'
    imwrite(PreprocessesImages,filename3);
    cd ..
    cd ..
end



for i=1:210
    
    filename2=strcat(num2str(i),filename);
    filename2=strcat(datapath,string2,filename2);
    filename3=strcat(num2str(i),filename1);
    a=imread(filename2);
     b=rgb2gray(a);
    c=b>150;
    c=medfilt2(c,[3 3]);
    se = strel('sphere',30);
    dilatedBW = imdilate(c, se);
    L = watershed_old(dilatedBW,1);
    L1=L.*dilatedBW;
    PreprocessesImages=zeros(512,512,3);
    PreprocessesImages(55:480,1:512,1)=a(55:480,1:512,1);
    PreprocessesImages(55:480,1:512,2)=a(55:480,1:512,2);
    PreprocessesImages(55:480,1:512,3)=a(55:480,1:512,3);
    a=double(PreprocessesImages);
    Inewc = a.*repmat(dilatedBW,[1,1,3]);
    PreprocessesImages=imresize(Inewc,[227 227]);
    PreprocessesImages=uint8(PreprocessesImages);
    cd 'PreprocessedDatabase\malign'
    imwrite(PreprocessesImages,filename3);
    cd ..
    cd ..
end
helpdlg('PreProcessing Completed')

% --- Executes on button press in Training.
function Training_Callback(hObject, eventdata, handles)
% hObject    handle to Training (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
datapath=pwd;
Datasetpath=fullfile(datapath,'PreprocessedDatabase');
trainingDS = imageDatastore(Datasetpath,'IncludeSubfolders',1,...
    'LabelSource','foldernames');
tbl = countEachLabel(trainingDS);

layers=[imageInputLayer([227 227 3])
        convolution2dLayer(5,20)
        reluLayer
        maxPooling2dLayer(2,'stride',2)
        convolution2dLayer(5,20)
        reluLayer
        maxPooling2dLayer(2,'stride',2)
        convolution2dLayer(5,20)
        reluLayer
        maxPooling2dLayer(2,'stride',2)
        fullyConnectedLayer(3)
        softmaxLayer
        classificationLayer()]
    
maxEpochs=900;
lr = 0.0001;
miniBatchSize = 64; % lower this if your GPU runs out of memory.

opts = trainingOptions('sgdm', ...
    'LearnRateSchedule', 'none',...
     'InitialLearnRate', lr,... 
     'MaxEpochs', maxEpochs, ...
      'MiniBatchSize', miniBatchSize,...
      'Plots','training-progress');
   
 analyzeNetwork(layers)
net = trainNetwork(trainingDS, layers, opts);

save('trainedNet.mat','net')

    

disp('exit');
% This could take over an hour to run, so lets stop and load a pre-traiend
% version that used the same data
warndlg('Training Completed');




% --- Executes on button press in Browse.
function Browse_Callback(hObject, eventdata, handles)
% hObject    handle to Browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 [filename, pathname] = uigetfile('*.*', 'Pick a Image');
    if isequal(filename,0) || isequal(pathname,0)
       warndlg('User pressed cancel')
    else
    filename=strcat(pathname,filename);
    a=imread(filename);
    axes(handles.axes1);
    imshow(a);
    handles.a=a;
    label='0';
set(handles.edit1,'String',label);clc

    end
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in Classify.
function Classify_Callback(hObject, eventdata, handles)
% hObject    handle to Classify (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

load('trainedNet.mat');

im=handles.a;
b=rgb2gray(im);
    c=b>150;
    c=medfilt2(c,[3 3]);
    se = strel('sphere',30);
    dilatedBW = imdilate(c, se);
    L = watershed_old(dilatedBW,1);
    L1=L.*dilatedBW;
    PreprocessesImages=zeros(512,512,3);
    PreprocessesImages(55:480,1:512,1)=im(55:480,1:512,1);
    PreprocessesImages(55:480,1:512,2)=im(55:480,1:512,2);
    PreprocessesImages(55:480,1:512,3)=im(55:480,1:512,3);
    a=double(PreprocessesImages);
    Inewc = a.*repmat(dilatedBW,[1,1,3]);
    PreprocessesImages=imresize(Inewc,[227 227]);
    PreprocessesImages=uint8(PreprocessesImages);
im=PreprocessesImages;
[M ,a]=plotfeatures(im);
[B,L,N] = bwboundaries(M);
axes(handles.axes2);
imshow(a);
% imshow(b);
hold on;


label = char(classify(net,im)); % classify with deep learning
label=char(label);
if strcmp(label,'malign')
    for k=1:length(B),
    boundary = B{k};
    if(k > N)
    axes(handles.axes2);

    plot(boundary(:,2), boundary(:,1), 'g','LineWidth',2);
    else
    axes(handles.axes2);

    plot(boundary(:,2), boundary(:,1), 'r','LineWidth',2);
    end
    end
    
elseif strcmp(label,'beningn')

    for k=1:length(B),
    boundary = B{k};
    if(k > N)
    axes(handles.axes2);

    plot(boundary(:,2), boundary(:,1), 'g','LineWidth',2);
    else
    axes(handles.axes2);

    plot(boundary(:,2), boundary(:,1), 'r','LineWidth',2);
    end
    end
    
end
% imshow(im);
set(handles.edit1,'String',label);clc

disp(label)
%  end


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
