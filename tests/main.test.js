const assert = require('assert');
const { initializeInteractions } = require('../src/js/main.js');

// Simple mock for document
global.document = {
    querySelectorAll: (selector) => {
        if (selector === 'h2') return [{}];
        return null;
    }
};

try {
    initializeInteractions();
    console.log('Test passed: initializeInteractions completed successfully.');
} catch (err) {
    console.error('Test failed:', err);
    process.exit(1);
}
