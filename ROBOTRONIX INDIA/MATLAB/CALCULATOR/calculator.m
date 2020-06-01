%% CALCULATOR
%% AUTHOR
% S SAI SURYATEJA, Vellore Institute of Technology, Vellore
%% Define the calculator
classdef calculator < matlab.apps.AppBase
    %% Properties that correspond to app components
    properties (Access = public)
        UIFigure         matlab.ui.Figure
        Button           matlab.ui.control.Button
        Button_2         matlab.ui.control.Button
        Button_3         matlab.ui.control.Button
        Button_4         matlab.ui.control.Button
        Button_5         matlab.ui.control.Button
        Button_6         matlab.ui.control.Button
        Button_7         matlab.ui.control.Button
        Button_8         matlab.ui.control.Button
        Button_9         matlab.ui.control.Button
        Button_10        matlab.ui.control.Button
        Button_11        matlab.ui.control.Button
        Button_12        matlab.ui.control.Button
        Button_15        matlab.ui.control.Button
        Button_14        matlab.ui.control.Button
        Button_13        matlab.ui.control.Button
        CButton          matlab.ui.control.Button
        sinButton        matlab.ui.control.Button
        cosButton        matlab.ui.control.Button
        tanButton        matlab.ui.control.Button
        logButton        matlab.ui.control.Button
        factorialButton  matlab.ui.control.Button
        Button_16        matlab.ui.control.Button
        expButton        matlab.ui.control.Button
        sinhButton       matlab.ui.control.Button
        coshButton       matlab.ui.control.Button
        tanhButton       matlab.ui.control.Button
        TextArea         matlab.ui.control.TextArea
        Button_19        matlab.ui.control.Button
        Button_20        matlab.ui.control.Button
        Button_21        matlab.ui.control.Button
        log10Button      matlab.ui.control.Button
        sqrtButton       matlab.ui.control.Button
        piButton         matlab.ui.control.Button
        absButton        matlab.ui.control.Button
        asinButton       matlab.ui.control.Button
        acosButton       matlab.ui.control.Button
        atanButton       matlab.ui.control.Button
        Button_23        matlab.ui.control.Button
        Button_24        matlab.ui.control.Button
    end

    %% Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: Button, Button_10, Button_2, 
        % Button_21, Button_3, Button_4, Button_5, Button_6, 
        % Button_7, Button_8, Button_9, piButton
        function ButtonPushed(app, event)
            value = app.TextArea.Value;
            app.TextArea.Value=[app.TextArea.Value{1} event.Source.Text];
        end

        % Button pushed function: CButton
        function CButtonPushed(app, event)
            app.TextArea.Value="";
        end

        % Button pushed function: Button_13
        function Button_13Pushed(app, event)
        try
            app.TextArea.Value = [app.TextArea.Value{1} event.Source.Text num2str(eval(app.TextArea.Value{1}))];
        catch 
            app.TextArea.Value='Error!';
        end
        end

        % Button pushed function: Button_11, Button_12, Button_14, 
        % Button_15, Button_16, Button_19, Button_20, absButton, 
        % expButton, factorialButton, logButton, sqrtButton
        function Button_11Pushed(app, event)
            app.TextArea.Value=[app.TextArea.Value{1} event.Source.Text];
        end

        % Button pushed function: cosButton, sinButton, tanButton
        function sinButtonPushed(app, event)
            app.TextArea.Value=[app.TextArea.Value{1} event.Source.Text];
        end

        % Button pushed function: coshButton, sinhButton, tanhButton
        function sinhButtonPushed(app, event)
            app.TextArea.Value=[app.TextArea.Value{1} event.Source.Text];
        end

        % Callback function
        function powerButtonPushed(app, event)
            app.TextArea.Value=[app.TextArea.Value{1} event.Source.Text];
        end

        % Callback function
        function Button_22Pushed(app, event)
            app.TextArea.Value=[app.TextArea.Value{1} event.Source.Text];
        end

        % Button pushed function: asinButton
        function asinButtonPushed(app, event)
            app.TextArea.Value=[app.TextArea.Value{1} event.Source.Text];
        end

        % Button pushed function: Button_23
        function Button_23Pushed(app, event)
           app.TextArea.Value=[app.TextArea.Value{1} event.Source.Text]; 
        end

        % Button pushed function: Button_24
        function Button_24Pushed(app, event)
           app.TextArea.Value=[app.TextArea.Value{1} event.Source.Text]; 
        end
    end

    %% Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 795 480];
            app.UIFigure.Name = 'UI Figure';

            % Create Button
            app.Button = uibutton(app.UIFigure, 'push');
            app.Button.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button.Position = [17 176 100 22];
            app.Button.Text = '1';

            % Create Button_2
            app.Button_2 = uibutton(app.UIFigure, 'push');
            app.Button_2.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button_2.Position = [144 176 100 22];
            app.Button_2.Text = '2';

            % Create Button_3
            app.Button_3 = uibutton(app.UIFigure, 'push');
            app.Button_3.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button_3.Position = [286 176 100 22];
            app.Button_3.Text = '3';

            % Create Button_4
            app.Button_4 = uibutton(app.UIFigure, 'push');
            app.Button_4.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button_4.Position = [17 141 100 22];
            app.Button_4.Text = '4';

            % Create Button_5
            app.Button_5 = uibutton(app.UIFigure, 'push');
            app.Button_5.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button_5.Position = [144 141 100 22];
            app.Button_5.Text = '5';

            % Create Button_6
            app.Button_6 = uibutton(app.UIFigure, 'push');
            app.Button_6.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button_6.Position = [286 141 100 22];
            app.Button_6.Text = '6';

            % Create Button_7
            app.Button_7 = uibutton(app.UIFigure, 'push');
            app.Button_7.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button_7.Position = [17 100 100 22];
            app.Button_7.Text = '7';

            % Create Button_8
            app.Button_8 = uibutton(app.UIFigure, 'push');
            app.Button_8.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button_8.Position = [144 100 100 22];
            app.Button_8.Text = '8';

            % Create Button_9
            app.Button_9 = uibutton(app.UIFigure, 'push');
            app.Button_9.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button_9.Position = [286 100 100 22];
            app.Button_9.Text = '9';

            % Create Button_10
            app.Button_10 = uibutton(app.UIFigure, 'push');
            app.Button_10.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button_10.Position = [17 54 100 22];
            app.Button_10.Text = '0';

            % Create Button_11
            app.Button_11 = uibutton(app.UIFigure, 'push');
            app.Button_11.ButtonPushedFcn = createCallbackFcn(app, @Button_11Pushed, true);
            app.Button_11.Position = [144 54 100 22];
            app.Button_11.Text = '+';

            % Create Button_12
            app.Button_12 = uibutton(app.UIFigure, 'push');
            app.Button_12.ButtonPushedFcn = createCallbackFcn(app, @Button_11Pushed, true);
            app.Button_12.Position = [286 54 100 22];
            app.Button_12.Text = '-';

            % Create Button_15
            app.Button_15 = uibutton(app.UIFigure, 'push');
            app.Button_15.ButtonPushedFcn = createCallbackFcn(app, @Button_11Pushed, true);
            app.Button_15.Position = [413 176 100 22];
            app.Button_15.Text = '*';

            % Create Button_14
            app.Button_14 = uibutton(app.UIFigure, 'push');
            app.Button_14.ButtonPushedFcn = createCallbackFcn(app, @Button_11Pushed, true);
            app.Button_14.Position = [413 141 100 22];
            app.Button_14.Text = '/';

            % Create Button_13
            app.Button_13 = uibutton(app.UIFigure, 'push');
            app.Button_13.ButtonPushedFcn = createCallbackFcn(app, @Button_13Pushed, true);
            app.Button_13.Position = [654 54 100 109];
            app.Button_13.Text = '=';

            % Create CButton
            app.CButton = uibutton(app.UIFigure, 'push');
            app.CButton.ButtonPushedFcn = createCallbackFcn(app, @CButtonPushed, true);
            app.CButton.Position = [17 214 100 22];
            app.CButton.Text = 'C';

            % Create sinButton
            app.sinButton = uibutton(app.UIFigure, 'push');
            app.sinButton.ButtonPushedFcn = createCallbackFcn(app, @sinButtonPushed, true);
            app.sinButton.Position = [286 249 100 22];
            app.sinButton.Text = 'sin(';

            % Create cosButton
            app.cosButton = uibutton(app.UIFigure, 'push');
            app.cosButton.ButtonPushedFcn = createCallbackFcn(app, @sinButtonPushed, true);
            app.cosButton.Position = [413 249 100 22];
            app.cosButton.Text = 'cos(';

            % Create tanButton
            app.tanButton = uibutton(app.UIFigure, 'push');
            app.tanButton.ButtonPushedFcn = createCallbackFcn(app, @sinButtonPushed, true);
            app.tanButton.Position = [538 249 100 22];
            app.tanButton.Text = 'tan(';

            % Create logButton
            app.logButton = uibutton(app.UIFigure, 'push');
            app.logButton.ButtonPushedFcn = createCallbackFcn(app, @Button_11Pushed, true);
            app.logButton.Position = [654 249 100 22];
            app.logButton.Text = 'log(';

            % Create factorialButton
            app.factorialButton = uibutton(app.UIFigure, 'push');
            app.factorialButton.ButtonPushedFcn = createCallbackFcn(app, @Button_11Pushed, true);
            app.factorialButton.Position = [538 100 100 22];
            app.factorialButton.Text = 'factorial(';

            % Create Button_16
            app.Button_16 = uibutton(app.UIFigure, 'push');
            app.Button_16.ButtonPushedFcn = createCallbackFcn(app, @Button_11Pushed, true);
            app.Button_16.Position = [538 176 100 22];
            app.Button_16.Text = '10^';

            % Create expButton
            app.expButton = uibutton(app.UIFigure, 'push');
            app.expButton.ButtonPushedFcn = createCallbackFcn(app, @Button_11Pushed, true);
            app.expButton.Position = [538 54 100 22];
            app.expButton.Text = 'exp(';

            % Create sinhButton
            app.sinhButton = uibutton(app.UIFigure, 'push');
            app.sinhButton.ButtonPushedFcn = createCallbackFcn(app, @sinhButtonPushed, true);
            app.sinhButton.Position = [286 290 100 22];
            app.sinhButton.Text = 'sinh(';

            % Create coshButton
            app.coshButton = uibutton(app.UIFigure, 'push');
            app.coshButton.ButtonPushedFcn = createCallbackFcn(app, @sinhButtonPushed, true);
            app.coshButton.Position = [413 290 100 22];
            app.coshButton.Text = 'cosh(';

            % Create tanhButton
            app.tanhButton = uibutton(app.UIFigure, 'push');
            app.tanhButton.ButtonPushedFcn = createCallbackFcn(app, @sinhButtonPushed, true);
            app.tanhButton.Position = [538 290 100 22];
            app.tanhButton.Text = 'tanh(';

            % Create TextArea
            app.TextArea = uitextarea(app.UIFigure);
            app.TextArea.HorizontalAlignment = 'right';
            app.TextArea.FontName = 'Bodoni MT';
            app.TextArea.FontSize = 40;
            app.TextArea.FontWeight = 'bold';
            app.TextArea.Position = [17 349 737 60];

            % Create Button_19
            app.Button_19 = uibutton(app.UIFigure, 'push');
            app.Button_19.ButtonPushedFcn = createCallbackFcn(app, @Button_11Pushed, true);
            app.Button_19.Position = [17 249 100 63];
            app.Button_19.Text = '(';

            % Create Button_20
            app.Button_20 = uibutton(app.UIFigure, 'push');
            app.Button_20.ButtonPushedFcn = createCallbackFcn(app, @Button_11Pushed, true);
            app.Button_20.Position = [144 249 100 64];
            app.Button_20.Text = ')';

            % Create Button_21
            app.Button_21 = uibutton(app.UIFigure, 'push');
            app.Button_21.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button_21.Position = [413 100 100 22];
            app.Button_21.Text = '.';

            % Create log10Button
            app.log10Button = uibutton(app.UIFigure, 'push');
            app.log10Button.Position = [654 290 100 22];
            app.log10Button.Text = 'log10(';

            % Create sqrtButton
            app.sqrtButton = uibutton(app.UIFigure, 'push');
            app.sqrtButton.ButtonPushedFcn = createCallbackFcn(app, @Button_11Pushed, true);
            app.sqrtButton.Position = [654 214 100 22];
            app.sqrtButton.Text = 'sqrt(';

            % Create piButton
            app.piButton = uibutton(app.UIFigure, 'push');
            app.piButton.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.piButton.Position = [144 214 100 22];
            app.piButton.Text = 'pi';

            % Create absButton
            app.absButton = uibutton(app.UIFigure, 'push');
            app.absButton.ButtonPushedFcn = createCallbackFcn(app, @Button_11Pushed, true);
            app.absButton.Position = [414 54 100 22];
            app.absButton.Text = 'abs(';

            % Create asinButton
            app.asinButton = uibutton(app.UIFigure, 'push');
            app.asinButton.ButtonPushedFcn = createCallbackFcn(app, @asinButtonPushed, true);
            app.asinButton.Position = [287 214 100 22];
            app.asinButton.Text = 'asin(';

            % Create acosButton
            app.acosButton = uibutton(app.UIFigure, 'push');
            app.acosButton.Position = [414 214 100 22];
            app.acosButton.Text = 'acos(';

            % Create atanButton
            app.atanButton = uibutton(app.UIFigure, 'push');
            app.atanButton.Position = [538 214 100 22];
            app.atanButton.Text = 'atan(';

            % Create Button_23
            app.Button_23 = uibutton(app.UIFigure, 'push');
            app.Button_23.ButtonPushedFcn = createCallbackFcn(app, @Button_23Pushed, true);
            app.Button_23.Position = [538 141 100 22];
            app.Button_23.Text = '^';

            % Create Button_24
            app.Button_24 = uibutton(app.UIFigure, 'push');
            app.Button_24.ButtonPushedFcn = createCallbackFcn(app, @Button_24Pushed, true);
            app.Button_24.VerticalAlignment = 'top';
            app.Button_24.Position = [654 176 100 22];
            app.Button_24.Text = '^-1';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    %% App creation and deletion
    methods (Access = public)

        % Construct app
        function app = calculator

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        %% Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end