document.getElementById("delete-storage").addEventListener("click", async () => {
  try {
    // Inject a script into the current tab to delete the local storage item
    await chrome.scripting.executeScript({
      target: { tabId: (await getCurrentTab()).id },
      func: deleteLocalStorageItem,
    });
    alert("'audio_device' has been deleted from local storage.");
  } catch (error) {
    console.error("Failed to delete local storage item:", error);
    alert("Could not delete the item. Ensure you are on https://trl.kab.info.");
  }
});

// Helper function to get the current tab
async function getCurrentTab() {
  const [tab] = await chrome.tabs.query({ active: true, currentWindow: true });
  return tab;
}

// The function to be executed in the context of the web page
function deleteLocalStorageItem() {
  if (window.location.origin === "https://trl.kab.info") {
    localStorage.removeItem("audio_device");
  } else {
    console.error("This script can only run on https://trl.kab.info.");
  }
}

