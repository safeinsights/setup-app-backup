function poll(): void {
    // eslint-disable-next-line no-console
    console.log(`Polling management app at ${new Date()}`)

    // TODO: Actually implement polling
}

// Poll once now and then every hour (3600000 ms)
poll()
setInterval(poll, 3600000)
