// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import {serve} from "https://deno.land/std@0.132.0/http/server.ts";
import { supabaseClient } from '../_utils/supabase_clients.ts'

console.log(`Function "select-from-table" up and running!`)

serve(async (req: Request) => {
    // This is needed if you're planning to invoke your function from a browser.

    try {
        // Set the Auth context of the user that called the function.
        // This way your row-level-security (RLS) policies are applied.

        const { data, error } = await supabaseClient.from('prompt_library').select('*')
        console.log({ data, error })

        return new Response(JSON.stringify({ data, error }), {
            headers: {'Content-Type': 'application/json' },
            status: 200,
        })
    } catch (error) {
        return new Response(JSON.stringify({ error: error.message }), {
            headers: {'Content-Type': 'application/json' },
            status: 400,
        })
    }
})

// To invoke:
// curl -i --location --request POST 'http://localhost:54321/functions/v1/select-from-table-with-auth-rls' \
//   --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24ifQ.625_WdcF3KHqz5amU0x2X5WWHP-OEs_4qj0ssLNHzTs' \
//   --header 'Content-Type: application/json' \
//   --data '{"name":"Functions"}'