/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import React from 'react';
import type {PropsWithChildren} from 'react';
import {
  SafeAreaView,
  ScrollView,
  StatusBar,
  StyleSheet,
  Text,
  useColorScheme,
  View,
  useWindowDimensions,
} from 'react-native';
import RTNMyPdfDisplay from 'rtn-my-pdf-display/js/RTNMyPdfDisplayNativeComponent';
import {Colors} from 'react-native/Libraries/NewAppScreen';

function App(): JSX.Element {
  const isDarkMode = useColorScheme() === 'dark';

  const backgroundStyle = {
    backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
  };

  const {width, height} = useWindowDimensions();

  return (
    <SafeAreaView style={backgroundStyle}>
      <StatusBar
        barStyle={isDarkMode ? 'light-content' : 'dark-content'}
        backgroundColor={backgroundStyle.backgroundColor}
      />
      <RTNMyPdfDisplay
        url="https://firebasestorage.googleapis.com/v0/b/spot-fb6be.appspot.com/o/sample-pdf-download-10-mb.pdf?alt=media&token=0bb9d7ac-ff00-4c6c-9497-002533d74351"
        style={{width, height}}
      />
    </SafeAreaView>
  );
}

// yarn add ./RTNMyPdfDisplay

// node myappiospdfurl/node_modules/react-native/scripts/generate-codegen-artifacts.js \
//   --path myappiospdfurl/ \
//   --outputPath myappiospdfurl/RTNMyPdfDisplay/generated/

export default App;
